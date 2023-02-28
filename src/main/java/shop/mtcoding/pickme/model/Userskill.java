package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class Userskill {
    private Integer resumeId;
    private String userskillName1;
    private String userskillName2;
    private String userskillName3;
    private String userskillName4;
    private String userskillName5;
    private String userskillName6;
    private Timestamp createdAt;
}
