package lk.example.jpamapping.onetoone.repository;

import lk.example.jpamapping.onetoone.entity.BookEntity;
import lk.example.jpamapping.onetoone.entity.PhotoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhotoRepository extends JpaRepository<PhotoEntity,Long> {
}
