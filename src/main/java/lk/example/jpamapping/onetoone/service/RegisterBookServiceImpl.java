package lk.example.jpamapping.onetoone.service;

import lk.example.jpamapping.onetoone.entity.BookEntity;
import lk.example.jpamapping.onetoone.entity.PhotoEntity;
import lk.example.jpamapping.onetoone.repository.BookRepository;
import lk.example.jpamapping.onetoone.repository.PhotoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class RegisterBookServiceImpl implements RegisterBookService{

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private PhotoRepository photoRepository;

    @Override
    public void registerBookBiDirectional() {
        System.out.println("<<< One-To-One bidirectional mapping started. >>>");

        long random = (long)(Math.random()*(1000-0+1)+0);

        BookEntity bookEntity = new BookEntity();
        bookEntity.setIsbn(random);
        bookEntity.setRating((double)random);
        bookEntity.setTitle("title" + random);
        bookEntity.setTotalPages((int)random);
        bookEntity.setPublishedDate(LocalDate.now());

        PhotoEntity photoEntity = new PhotoEntity();
        photoEntity.setUrl("URL" + random);
        bookEntity.setPhotoEntity(photoEntity);
        bookRepository.saveAndFlush(bookEntity);

        System.out.println("<<< One-To-One bidirectional mapping success. >>>");

        List<PhotoEntity> photoEntities = photoRepository.findAll();
        System.out.println("fetch from photo entity side >>> " + photoEntities.size() + " Book Id>> " + photoEntities.get(0).getBookEntity().getId());

        List<BookEntity> bookEntities = bookRepository.findAll();
        System.out.println("fetch from Book entity side >>> " + bookEntities.size() + " Photo Id >> " + bookEntities.get(0).getPhotoEntity().getId());

        /**
         *
         *
         * <<< One-To-One bidirectional mapping started. >>>
         * Hibernate: insert into one_to_one.photo (url) values (?)
         * Hibernate: insert into one_to_one.book (isbn, photo_id, published_date, rating, title, total_pages) values (?, ?, ?, ?, ?, ?)
         * <<< One-To-One bidirectional mapping success. >>>
         * Hibernate: select photoentit0_.photo_id as photo_id1_1_, photoentit0_.url as url2_1_ from one_to_one.photo photoentit0_
         * Hibernate: select bookentity0_.book_id as book_id1_0_0_, bookentity0_.isbn as isbn2_0_0_, bookentity0_.photo_id as photo_id7_0_0_, bookentity0_.published_date as publishe3_0_0_, bookentity0_.rating as rating4_0_0_, bookentity0_.title as title5_0_0_, bookentity0_.total_pages as total_pa6_0_0_ from one_to_one.book bookentity0_ where bookentity0_.photo_id=?
         * Hibernate: select bookentity0_.book_id as book_id1_0_0_, bookentity0_.isbn as isbn2_0_0_, bookentity0_.photo_id as photo_id7_0_0_, bookentity0_.published_date as publishe3_0_0_, bookentity0_.rating as rating4_0_0_, bookentity0_.title as title5_0_0_, bookentity0_.total_pages as total_pa6_0_0_ from one_to_one.book bookentity0_ where bookentity0_.photo_id=?
         * fetch from photo entity side >>> 3 Book Id>> 1
         * Hibernate: select bookentity0_.book_id as book_id1_0_, bookentity0_.isbn as isbn2_0_, bookentity0_.photo_id as photo_id7_0_, bookentity0_.published_date as publishe3_0_, bookentity0_.rating as rating4_0_, bookentity0_.title as title5_0_, bookentity0_.total_pages as total_pa6_0_ from one_to_one.book bookentity0_
         * fetch from Book entity side >>> 3 Photo Id >> 1
         *
         * */
    }
}
