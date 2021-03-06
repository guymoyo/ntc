// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.domain;

import com.guymoyo.ntc.domain.Pays;
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

privileged aspect Pays_Roo_Entity {
    
    declare @type: Pays: @Entity;
    
    @PersistenceContext
    transient EntityManager Pays.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Pays.id;
    
    @Version
    @Column(name = "version")
    private Integer Pays.version;
    
    public Long Pays.getId() {
        return this.id;
    }
    
    public void Pays.setId(Long id) {
        this.id = id;
    }
    
    public Integer Pays.getVersion() {
        return this.version;
    }
    
    public void Pays.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Pays.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Pays.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Pays attached = Pays.findPays(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Pays.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Pays.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Pays Pays.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Pays merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Pays.entityManager() {
        EntityManager em = new Pays().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Pays.countPayses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Pays o", Long.class).getSingleResult();
    }
    
    public static List<Pays> Pays.findAllPayses() {
        return entityManager().createQuery("SELECT o FROM Pays o", Pays.class).getResultList();
    }
    
    public static Pays Pays.findPays(Long id) {
        if (id == null) return null;
        return entityManager().find(Pays.class, id);
    }
    
    public static List<Pays> Pays.findPaysEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Pays o", Pays.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
