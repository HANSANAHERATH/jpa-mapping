package lk.example.jpamapping.criteriaapi.controller;

import lk.example.jpamapping.criteriaapi.dto.ApiResponseDto;
import lk.example.jpamapping.criteriaapi.dto.BookSearchDto;
import lk.example.jpamapping.criteriaapi.dto.BookSearchResponseDto;
import lk.example.jpamapping.criteriaapi.dto.PaginationDto;
import lk.example.jpamapping.criteriaapi.entity.BookHolderEntity;
import lk.example.jpamapping.criteriaapi.service.CriteriaSearch;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@Slf4j
@RequestMapping("/book/search")
public class CriteriaSearchController {
    private final CriteriaSearch criteriaSearch;

    @GetMapping("/")
    public ResponseEntity<ApiResponseDto> getCmRBusinessTypeById(BookSearchDto bookSearchDto, Pageable pageable) {
        log.debug("REST request to search books");
        ApiResponseDto apiResponseDto = new ApiResponseDto();
        PaginationDto paginationDto = new PaginationDto();
        Page<BookHolderEntity> bookHolderEntities = criteriaSearch.searchBook(bookSearchDto, pageable);
        paginationDto.setTotal((int) bookHolderEntities.getTotalElements());
        paginationDto.setPageSize(bookHolderEntities.getNumberOfElements());
        paginationDto.setFrom((pageable.getPageSize() * pageable.getPageNumber()) + 1);
        paginationDto.setTo((pageable.getPageSize() * pageable.getPageNumber()) + bookHolderEntities.getNumberOfElements());
        apiResponseDto.setResponse(bookHolderEntities.getContent());
        apiResponseDto.setPaginationDto(paginationDto);
        return new ResponseEntity<>(apiResponseDto, HttpStatus.OK);
    }
}
