/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oith.ws.dom.hcm.pmis;

import oith.ws.dom.core.User;
import oith.ws.dom.core.hrm.om.Emp;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author mbadiuzzaman
 */
@Document(collection = "AppPromoteDemote")
public class AppPromoteDemote extends AbstAssignmentAltApp{

    public AppPromoteDemote(User user, Emp emp) {
        super(user, emp);
    }
    
}
