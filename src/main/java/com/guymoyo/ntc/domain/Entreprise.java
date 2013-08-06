package com.guymoyo.ntc.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import com.guymoyo.ntc.domain.SecteurActivite;
import javax.persistence.ManyToOne;
import com.guymoyo.ntc.domain.SousSecteurActivite;
import com.guymoyo.ntc.domain.Pays;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.guymoyo.ntc.domain.UserAccount;

@RooJavaBean
@RooToString
@RooEntity
public class Entreprise {

    @NotNull
    private String raisonSociale;

    private String statutJuridique;

    private String adresse;

    private String telephone;

    @ManyToOne
    private SecteurActivite secteurActivite;

    @ManyToOne
    private SousSecteurActivite sousSecteurActivite;

    @NotNull
    private String dateCreation;

    @NotNull
    private String siegeSocial;

    private String capital;

    private String directeurGeneral;

    private String nbreEmploye;

    @ManyToOne
    private Pays pays;

    @Size(max = 255)
    private String description;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date createdAt;

    @ManyToOne
    private UserAccount createdBy;
}
