package lk.example.jpamapping.manytoone.repository;

import lk.example.jpamapping.manytoone.entity.MobileEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MobileRepository extends JpaRepository<MobileEntity, Long> {
}
