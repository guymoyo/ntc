// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.domain;

import java.lang.String;

privileged aspect Entreprise_Roo_ToString {
    
    public String Entreprise.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Adresse: ").append(getAdresse()).append(", ");
        sb.append("Capital: ").append(getCapital()).append(", ");
        sb.append("CreatedAt: ").append(getCreatedAt()).append(", ");
        sb.append("CreatedBy: ").append(getCreatedBy()).append(", ");
        sb.append("DateCreation: ").append(getDateCreation()).append(", ");
        sb.append("Description: ").append(getDescription()).append(", ");
        sb.append("DirecteurGeneral: ").append(getDirecteurGeneral()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("NbreEmploye: ").append(getNbreEmploye()).append(", ");
        sb.append("Pays: ").append(getPays()).append(", ");
        sb.append("RaisonSociale: ").append(getRaisonSociale()).append(", ");
        sb.append("SecteurActivite: ").append(getSecteurActivite()).append(", ");
        sb.append("SiegeSocial: ").append(getSiegeSocial()).append(", ");
        sb.append("SousSecteurActivite: ").append(getSousSecteurActivite()).append(", ");
        sb.append("StatutJuridique: ").append(getStatutJuridique()).append(", ");
        sb.append("Telephone: ").append(getTelephone()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
