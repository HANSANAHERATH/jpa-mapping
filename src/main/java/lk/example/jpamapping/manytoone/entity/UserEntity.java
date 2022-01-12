package lk.example.jpamapping.manytoone.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "user", schema = "many_to_one")
@NoArgsConstructor
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @Column(nullable = false)
    private String name;

    @OneToMany( mappedBy= "userEntity" ,cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<MobileEntity> mobileEntities= new ArrayList<>();

    public void setMobileEntities(List<MobileEntity> mobileEntities){
        this.mobileEntities = mobileEntities;
        for(MobileEntity mobileEntity: mobileEntities){
            mobileEntity.setUserEntity(this);
        }
    }

}