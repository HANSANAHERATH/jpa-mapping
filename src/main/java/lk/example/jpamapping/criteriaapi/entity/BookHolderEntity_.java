package lk.example.jpamapping.criteriaapi.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import java.time.LocalDate;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(BookHolderEntity.class)
public abstract class BookHolderEntity_ {
    private static final String BOOK_ID = "id";
    private static final String BOOK_TITLE = "title";
    private static final String BOOK_RATING = "rating";
    private static final String BOOK_PUBLISHED_DATE = "publishedDate";

    public static volatile SingularAttribute<BookHolderEntity, Long> id;
    public static volatile SingularAttribute<BookHolderEntity, String> title;
    public static volatile SingularAttribute<BookHolderEntity, Double> rating;
    public static volatile SingularAttribute<BookHolderEntity, LocalDate> publishedDate;
}