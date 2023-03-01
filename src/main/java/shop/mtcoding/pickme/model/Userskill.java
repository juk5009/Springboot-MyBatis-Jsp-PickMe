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
    private String userskillName;
    private Timestamp createdAt;
}
