package com.guymoyo.ntc.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import com.guymoyo.ntc.domain.Pays;
import javax.persistence.ManyToOne;
import com.guymoyo.ntc.domain.Region;
import com.guymoyo.ntc.domain.Departement;
import com.guymoyo.ntc.domain.Arrondissement;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import com.guymoyo.ntc.domain.UserAccount;

@RooJavaBean
@RooToString
@RooEntity
public class Site {

    @ManyToOne
    private Pays pays;

    @ManyToOne
    private Region region;

    @ManyToOne
    private Departement departement;

    @ManyToOne
    private Arrondissement arrondissement;

    private String localite;

    @Size(max = 255)
    private String envGeophysique;

    @Size(max = 255)
    private String envBiologique;

    @Size(max = 255)
    private String envSocioEconomiqueEtHumain;

    @Size(max = 255)
    private String sensibiliteMilieu;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date createdAt;

    @ManyToOne
    private UserAccount createdBy;
}
