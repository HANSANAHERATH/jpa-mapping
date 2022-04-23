package lk.example.jpamapping.criteriaapi.entity;

import lk.example.jpamapping.onetoone.entity.PhotoEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "book", schema = "criteria_search", indexes = {
        @Index(name = "idx_book_book_id_rating_unq", columnList = "rating ASC", unique = true)
})
@NoArgsConstructor
public class BookHolderEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private Long id;

    @Column(nullable = false)
    private String title;

    private Long isbn;
    private Integer totalPages;
    private Double rating;
    private LocalDate publishedDate;
}