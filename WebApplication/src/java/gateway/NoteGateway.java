package gateway;

import common.BaseGateway;
import entity.NoteIF;
import jakarta.ejb.Stateless;

@Stateless
public class NoteGateway extends BaseGateway {
    
    public void insert(NoteIF model) {
        
        getEntityManager().persist(model);
    }
}
