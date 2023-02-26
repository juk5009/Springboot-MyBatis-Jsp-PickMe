package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Company {
    private int id;
    private String companyid;
    private String companypassword;
    private String companyname;
    private String companyemail;
    private String companyaddress;
    private String companylocation;
    private String companytel;
    private String companyprofile;
    private Timestamp createdAt;
}
