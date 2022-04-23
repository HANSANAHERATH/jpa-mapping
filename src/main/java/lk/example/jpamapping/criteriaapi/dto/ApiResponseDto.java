package lk.example.jpamapping.criteriaapi.dto;

import lombok.*;

import java.io.Serializable;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ApiResponseDto<T> implements Serializable {
    private static final long serialVersionUID = 1031497392232283687L;

    private PaginationDto paginationDto;
    private List<T> response;
}
