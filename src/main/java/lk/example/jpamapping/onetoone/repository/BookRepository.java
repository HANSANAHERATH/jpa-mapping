package lk.example.jpamapping.onetoone.repository;

import lk.example.jpamapping.onetoone.entity.BookEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<BookEntity,Long> {
}
