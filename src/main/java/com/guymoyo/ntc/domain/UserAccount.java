package com.guymoyo.ntc.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import com.guymoyo.ntc.domain.RoleName;
import javax.persistence.Enumerated;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class UserAccount {

    @NotNull
    @Column(unique = true)
    @Size(min = 3)
    private String identifier;

    @NotNull
    @Size(min = 5)
    private String password;

    private String nom;

    private String prenom;

    @NotNull
    @Enumerated
    private RoleName roles;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date createdAt;

    @ManyToOne
    private com.guymoyo.ntc.domain.UserAccount createdBy;

    private Boolean block;
}
