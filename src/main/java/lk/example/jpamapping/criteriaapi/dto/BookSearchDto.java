package lk.example.jpamapping.criteriaapi.dto;

import lk.example.jpamapping.criteriaapi.utils.filter.DoubleFilter;
import lk.example.jpamapping.criteriaapi.utils.filter.LocalDateFilter;
import lk.example.jpamapping.criteriaapi.utils.filter.LongFilter;
import lk.example.jpamapping.criteriaapi.utils.filter.StringFilter;
import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class BookSearchDto implements Serializable {
    private static final long serialVersionUID = 1031497392232283687L;

    private LongFilter bookId;
    private StringFilter bookTitle;
    private DoubleFilter bookRating;
    private LocalDateFilter bookPublishedDate;
}
