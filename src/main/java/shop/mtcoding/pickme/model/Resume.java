package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Resume {
    private Integer id;
    private Integer userId;
    private String resumeName;
    private String resumeBirth;
    private String resumeEmail;
    private String resumeAddress;
    private String resumeLocation;
    private String resumeGrade;
    private String resumePhoneNumber;
    private String resumeSex;
    private String resumeContent;
    private Timestamp createdAt;
};