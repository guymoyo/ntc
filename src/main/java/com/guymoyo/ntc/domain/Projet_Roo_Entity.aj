// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.domain;

import com.guymoyo.ntc.domain.Projet;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Projet_Roo_Entity {
    
    declare @type: Projet: @Entity;
    
    @PersistenceContext
    transient EntityManager Projet.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Projet.id;
    
    @Version
    @Column(name = "version")
    private Integer Projet.version;
    
    public Long Projet.getId() {
        return this.id;
    }
    
    public void Projet.setId(Long id) {
        this.id = id;
    }
    
    public Integer Projet.getVersion() {
        return this.version;
    }
    
    public void Projet.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Projet.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Projet.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Projet attached = Projet.findProjet(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Projet.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Projet.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Projet Projet.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Projet merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Projet.entityManager() {
        EntityManager em = new Projet().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Projet.countProjets() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Projet o", Long.class).getSingleResult();
    }
    
    public static List<Projet> Projet.findAllProjets() {
        return entityManager().createQuery("SELECT o FROM Projet o", Projet.class).getResultList();
    }
    
    public static Projet Projet.findProjet(Long id) {
        if (id == null) return null;
        return entityManager().find(Projet.class, id);
    }
    
    public static List<Projet> Projet.findProjetEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Projet o", Projet.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
