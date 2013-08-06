// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.ntc.domain;

import com.guymoyo.ntc.domain.RoleName;
import com.guymoyo.ntc.domain.UserAccount;
import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect UserAccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserAccountDataOnDemand: @Component;
    
    private Random UserAccountDataOnDemand.rnd = new SecureRandom();
    
    private List<UserAccount> UserAccountDataOnDemand.data;
    
    public UserAccount UserAccountDataOnDemand.getNewTransientUserAccount(int index) {
        UserAccount obj = new UserAccount();
        setBlock(obj, index);
        setCreatedAt(obj, index);
        setCreatedBy(obj, index);
        setIdentifier(obj, index);
        setNom(obj, index);
        setPassword(obj, index);
        setPrenom(obj, index);
        setRoles(obj, index);
        return obj;
    }
    
    public void UserAccountDataOnDemand.setBlock(UserAccount obj, int index) {
        Boolean block = Boolean.TRUE;
        obj.setBlock(block);
    }
    
    public void UserAccountDataOnDemand.setCreatedAt(UserAccount obj, int index) {
        Date createdAt = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedAt(createdAt);
    }
    
    public void UserAccountDataOnDemand.setCreatedBy(UserAccount obj, int index) {
        UserAccount createdBy = obj;
        obj.setCreatedBy(createdBy);
    }
    
    public void UserAccountDataOnDemand.setIdentifier(UserAccount obj, int index) {
        String identifier = "identifier_" + index;
        obj.setIdentifier(identifier);
    }
    
    public void UserAccountDataOnDemand.setNom(UserAccount obj, int index) {
        String nom = "nom_" + index;
        obj.setNom(nom);
    }
    
    public void UserAccountDataOnDemand.setPassword(UserAccount obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void UserAccountDataOnDemand.setPrenom(UserAccount obj, int index) {
        String prenom = "prenom_" + index;
        obj.setPrenom(prenom);
    }
    
    public void UserAccountDataOnDemand.setRoles(UserAccount obj, int index) {
        RoleName roles = RoleName.class.getEnumConstants()[0];
        obj.setRoles(roles);
    }
    
    public UserAccount UserAccountDataOnDemand.getSpecificUserAccount(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        UserAccount obj = data.get(index);
        return UserAccount.findUserAccount(obj.getId());
    }
    
    public UserAccount UserAccountDataOnDemand.getRandomUserAccount() {
        init();
        UserAccount obj = data.get(rnd.nextInt(data.size()));
        return UserAccount.findUserAccount(obj.getId());
    }
    
    public boolean UserAccountDataOnDemand.modifyUserAccount(UserAccount obj) {
        return false;
    }
    
    public void UserAccountDataOnDemand.init() {
        data = UserAccount.findUserAccountEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserAccount' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<com.guymoyo.ntc.domain.UserAccount>();
        for (int i = 0; i < 10; i++) {
            UserAccount obj = getNewTransientUserAccount(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
