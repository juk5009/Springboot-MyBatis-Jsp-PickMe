package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class User {
    private int id;
    private String userid;
    private String userpassword;
    private String username;
    private String userbirth;
    private String useremail;
    private String useraddress;
    private String userlocation;
    private String usergrade;
    private String userphonenumber;
    private String usersex;
    private String userprofile;
    private Timestamp createdAt;
}
