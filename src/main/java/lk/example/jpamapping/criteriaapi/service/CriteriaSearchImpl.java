package lk.example.jpamapping.criteriaapi.service;

import lk.example.jpamapping.criteriaapi.dto.BookSearchDto;
import lk.example.jpamapping.criteriaapi.entity.BookHolderEntity;
import lk.example.jpamapping.criteriaapi.entity.BookHolderEntity_;
import lk.example.jpamapping.criteriaapi.repository.BookHolderRepository;
import lk.example.jpamapping.criteriaapi.utils.QueryService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CriteriaSearchImpl implements CriteriaSearch {

    private final BookHolderRepository repository;

    @Override
    public Page<BookHolderEntity> searchBook(BookSearchDto bookSearchDto, Pageable pageable) {
        final Specification<BookHolderEntity> specification = createSpecificationForBookSearchFilter(bookSearchDto);
        return repository.findAll(specification, pageable);
    }

    private Specification<BookHolderEntity> createSpecificationForBookSearchFilter(BookSearchDto bookSearchDto) {
        QueryService<BookHolderEntity> queryService = new QueryService<>();
        Specification<BookHolderEntity> specification = Specification.where(null);
        if (null != bookSearchDto){
            if (null != bookSearchDto.getBookId()){
                specification = specification.and(queryService.buildSpecification(bookSearchDto.getBookId(), BookHolderEntity_.id));
            }

            if (null != bookSearchDto.getBookTitle()){
                specification = specification.and(queryService.buildStringSpecification(bookSearchDto.getBookTitle(), BookHolderEntity_.title));
            }

            if (null != bookSearchDto.getBookRating()){
                specification = specification.and(queryService.buildRangeSpecification(bookSearchDto.getBookRating(), BookHolderEntity_.rating));
            }

            if (null != bookSearchDto.getBookPublishedDate()){
                specification = specification.and(queryService.buildRangeSpecification(bookSearchDto.getBookPublishedDate(), BookHolderEntity_.publishedDate));
            }
        }
        return specification;
    }
}
