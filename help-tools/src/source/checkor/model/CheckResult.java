package source.checkor.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CheckResult {

    private int errorLine;

    private String contentError;

    private String errorMsg;
}
