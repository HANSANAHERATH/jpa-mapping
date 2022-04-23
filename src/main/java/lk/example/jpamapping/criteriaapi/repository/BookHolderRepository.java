package lk.example.jpamapping.criteriaapi.repository;

import lk.example.jpamapping.criteriaapi.entity.BookHolderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface BookHolderRepository extends JpaRepository<BookHolderEntity,Long>, JpaSpecificationExecutor<BookHolderEntity> {
}
