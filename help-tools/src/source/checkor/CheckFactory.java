package source.checkor;

import com.github.javaparser.StaticJavaParser;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import source.checkor.collector.CodingRuleCollector;
import source.checkor.collector.ConventionCollector;
import source.checkor.common.AbsCollector;
import source.checkor.model.CheckResult;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CheckFactory {

    public static CheckFactory getInstance() {
        return new CheckFactory();
    }

    public List<CheckResult> execute(Path path) throws IOException {

        List<CheckResult> checkResults = new ArrayList<>();

        List<AbsCollector> collectors = new ArrayList<>();

        collectors.add(new CodingRuleCollector());
        collectors.add(new ConventionCollector());

        if (FileUtils.isDirectory(path.toFile())) {
            try (Stream<Path> pathStream = Files.walk(path).filter(Files::isRegularFile)) {

                pathStream.filter(p -> "java".equals(FilenameUtils.getExtension(p.toString())))
                        .forEach(pathFile -> {
                            collectors.parallelStream()
                                    .forEach(absCollector -> {
                                        try {
                                            checkResults.addAll(absCollector.doCheck(StaticJavaParser.parse(pathFile.toFile())));
                                        } catch (FileNotFoundException e) {
                                            throw new RuntimeException(e);
                                        }
                                    });
                        });
            }
        } else {

            collectors.parallelStream()
                    .forEach(absCollector -> {
                        try {
                            checkResults.addAll(absCollector.doCheck(StaticJavaParser.parse(path.toFile())));
                        } catch (FileNotFoundException e) {
                            throw new RuntimeException(e);
                        }
                    });
        }

        return checkResults;
    }
}
