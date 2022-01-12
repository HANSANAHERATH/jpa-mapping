package lk.example.jpamapping.manytomany.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Entity
@Table(name = "post_details", schema = "many_to_many")
@NoArgsConstructor
public class PostDetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_detail_id")
    private Long id;

    @Column(nullable = false)
    private String url;

    @ManyToMany(mappedBy = "postDetailsEntities",cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<PostEntity> postEntities = new ArrayList<>();

    public void post(PostEntity postEntity) {
        postEntities.add(postEntity);
        postEntity.getPostDetailsEntities().add(this);
    }
}
