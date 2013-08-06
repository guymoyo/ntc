package com.guymoyo.ntc.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.guymoyo.ntc.domain.Entreprise;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import com.guymoyo.ntc.domain.TypeProjet;
import javax.persistence.Enumerated;
import java.util.Set;
import com.guymoyo.ntc.domain.Site;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.guymoyo.ntc.domain.UserAccount;

@RooJavaBean
@RooToString
@RooEntity
public class Projet {

    @ManyToOne
    private Entreprise entreprise;

    @NotNull
    @Column(unique = true)
    private String nom;

    @NotNull
    @Enumerated
    private TypeProjet typeProjet;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Site> site = new HashSet<Site>();

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date dateDebut;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date dateFin;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date createdAt;

    @ManyToOne
    private UserAccount createdBy;
}
