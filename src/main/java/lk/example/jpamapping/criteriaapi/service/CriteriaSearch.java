package lk.example.jpamapping.criteriaapi.service;

import lk.example.jpamapping.criteriaapi.dto.BookSearchDto;
import lk.example.jpamapping.criteriaapi.entity.BookHolderEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CriteriaSearch {
    Page<BookHolderEntity> searchBook(BookSearchDto bookSearchDto, Pageable pageable);
}
