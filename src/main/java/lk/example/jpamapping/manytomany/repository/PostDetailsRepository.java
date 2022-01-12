package lk.example.jpamapping.manytomany.repository;

import lk.example.jpamapping.manytomany.entity.PostDetailsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDetailsRepository extends JpaRepository<PostDetailsEntity, Long> {
}
