package pl.kubieniec.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import pl.kubieniec.validate.DetailUserInfo;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false)
    @Size(min = 2, max = 30)
    @NotBlank
    private String login;

    @Column(nullable = false)
    @NotBlank
    private String password;

    @Column(nullable = false)
    @Email
    private String email;

    @Column(nullable = false)
    private LocalDateTime created;

    @Column(name = "first_name")
    @NotBlank(groups = DetailUserInfo.class)
    private String firstName;

    @Column(name = "last_name")
    @NotBlank(groups = DetailUserInfo.class)
    private String lastName;

    @Column(name = "about_me")
    @NotBlank(groups = DetailUserInfo.class)
    private String aboutMe;

    @Column(name = "phone_number")
    @NotBlank(groups = DetailUserInfo.class)
    private String phoneNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
