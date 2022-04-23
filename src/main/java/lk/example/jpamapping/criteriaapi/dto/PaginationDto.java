package lk.example.jpamapping.criteriaapi.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PaginationDto {
    private Integer from;
    private Integer to;
    private Integer total;
    private Integer pageSize;
}
