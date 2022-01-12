package lk.example.jpamapping.manytomany.repository;

import lk.example.jpamapping.manytomany.entity.PostEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends JpaRepository<PostEntity, Long> {
}
