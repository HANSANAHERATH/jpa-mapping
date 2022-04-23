package lk.example.jpamapping.criteriaapi.dto;

import lombok.*;

import javax.persistence.Column;
import java.io.Serializable;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class BookSearchResponseDto implements Serializable {
    private static final long serialVersionUID = 1031497392232283687L;

    private Long id;
    private String title;
    private Long isbn;
    private Integer totalPages;
    private Double rating;
    private LocalDate publishedDate;
}
