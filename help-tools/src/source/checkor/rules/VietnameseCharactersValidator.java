package source.checkor.rules;

import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.comments.Comment;
import com.github.javaparser.ast.comments.JavadocComment;
import com.github.javaparser.javadoc.Javadoc;
import com.github.javaparser.javadoc.JavadocBlockTag;
import source.checkor.common.Validator;
import source.checkor.model.CheckResult;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VietnameseCharactersValidator implements Validator {
    private final Pattern vietnameseCharactersPattern = Pattern.compile("[\\u00C0-\\u1EF9\\u1EFA-\\u1EFF]");
    @Override
    public List<CheckResult> valid(CompilationUnit cu) {

        List<CheckResult> results = new ArrayList<>();

        List<Comment> comments = cu.getAllComments();

        comments.parallelStream()
                .forEach(comment -> {
                    boolean vietnameseCharactersFound = false;

                    // The comment is a javadoc comment
                    if (comment.isJavadocComment()) {
                        JavadocComment javadocComment = comment.asJavadocComment();

                        Javadoc javadoc = javadocComment.parse();

                        vietnameseCharactersFound = javadoc.getBlockTags().stream().anyMatch(blockTag -> {
                            if (blockTag.getType().equals(JavadocBlockTag.Type.AUTHOR)) {
                                return false;
                            }

                            Matcher vietnameseCharactersMatcher = vietnameseCharactersPattern.matcher(blockTag.getContent().toText());
                            return vietnameseCharactersMatcher.find();
                        });
                    } else {
                        Matcher vietnameseCharactersMatcher = vietnameseCharactersPattern.matcher(comment.getContent());
                        vietnameseCharactersFound = vietnameseCharactersMatcher.find();
                    }

                    // if a Vietnamese character has been found in the target source
                    if (vietnameseCharactersFound) {
                        CheckResult result = CheckResult.builder()
                                .errorLine(comment.getBegin().get().line)
                                .contentError(comment.getContent())
                                .errorMsg("Source không được chứa nội dung tiếng việt.").build();

                        results.add(result);
                    }
                });

        return results;
    }
}
