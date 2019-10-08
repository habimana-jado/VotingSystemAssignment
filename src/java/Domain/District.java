
package Domain;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class District implements Serializable {
    @Id
    private String id;
    private String name;
    
    @OneToMany(mappedBy = "district")
    private List<Citizen> citizen;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Citizen> getCitizen() {
        return citizen;
    }

    public void setCitizen(List<Citizen> citizen) {
        this.citizen = citizen;
    }
    
    
}
