package lk.example.jpamapping.manytomany.service;

import lk.example.jpamapping.manytomany.entity.PostDetailsEntity;
import lk.example.jpamapping.manytomany.entity.PostEntity;
import lk.example.jpamapping.manytomany.repository.PostDetailsRepository;
import lk.example.jpamapping.manytomany.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CreatePostServiceImpl implements CreatePost{

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private PostDetailsRepository postDetailsRepository;

    @Override
    public void save() {
        System.out.println("<<< Start saving Many-to-Many relationship >>>");
        long random = (long)(Math.random()*(1000-0+1)+0);

        PostEntity postEntity = new PostEntity();

        postEntity.setTitle("title " + random);
        postEntity.setPublishedDate(LocalDate.now());

        List<PostDetailsEntity> postDetailsEntityList = new ArrayList<>();

        PostDetailsEntity postDetailsEntity1 = new PostDetailsEntity();
        postDetailsEntity1.setUrl("URL " + random);
        postDetailsEntityList.add(postDetailsEntity1);

        PostDetailsEntity postDetailsEntity2 = new PostDetailsEntity();
        postDetailsEntity2.setUrl("URL " + (long)(Math.random()*(1000-0+1)+0));
        postDetailsEntityList.add(postDetailsEntity2);

        postEntity.setPostDetailsEntities(postDetailsEntityList);

        postRepository.saveAndFlush(postEntity);

        System.out.println("<<< Saving Many-to-Many relationship Success. >>>");

        List<PostEntity> postEntities = postRepository.findAll();
        System.out.println("Fetch from Post entity side > " + postEntities.size() + "< PostDetailsEntity Size > " + postEntities.get(0).getPostDetailsEntities().size());

        List<PostDetailsEntity> postDetailsEntities = postDetailsRepository.findAll();
        System.out.println("Fetch from PostDetails entity side > " + postDetailsEntities.size() + "< PostEntity Size > " + postDetailsEntities.get(0).getPostEntities().size());

        System.out.println("<<< Update from post entity side >>>");
        Optional<PostEntity> fetchedPostEntity = postRepository.findById((long)7);
        fetchedPostEntity.get().getPostDetailsEntities().get(0).setUrl("new URL");
        fetchedPostEntity.get().setTitle("new Title");
        postRepository.saveAndFlush(fetchedPostEntity.get());
        System.out.println("<<< Update from post entity side End >>>");

        System.out.println("<<< Update from postDetails entity side >>>");
        Optional<PostDetailsEntity> fetchedPostDetailsEntity = postDetailsRepository.findById((long)10);
        fetchedPostDetailsEntity.get().getPostEntities().get(0).setTitle("NEW TITLE1");
        fetchedPostDetailsEntity.get().setUrl("NEW URL1");
        postDetailsRepository.saveAndFlush(fetchedPostDetailsEntity.get());
        System.out.println("<<< Update from postDetails entity side End >>>");


        /**
         *
         * <<< Start saving Many-to-Many relationship >>>
         * Hibernate: insert into many_to_many.post (published_date, title) values (?, ?)
         * Hibernate: insert into many_to_many.post_details (url) values (?)
         * Hibernate: insert into many_to_many.post_details (url) values (?)
         * Hibernate: insert into many_to_many.post_details_mapping (post_id, post_detail_id) values (?, ?)
         * Hibernate: insert into many_to_many.post_details_mapping (post_id, post_detail_id) values (?, ?)
         * <<< Saving Many-to-Many relationship Success. >>>
         * Hibernate: select postentity0_.post_id as post_id1_0_, postentity0_.published_date as publishe2_0_, postentity0_.title as title3_0_ from many_to_many.post postentity0_
         * Hibernate: select postdetail0_.post_id as post_id1_2_0_, postdetail0_.post_detail_id as post_det2_2_0_, postdetail1_.post_detail_id as post_det1_1_1_, postdetail1_.url as url2_1_1_ from many_to_many.post_details_mapping postdetail0_ inner join many_to_many.post_details postdetail1_ on postdetail0_.post_detail_id=postdetail1_.post_detail_id where postdetail0_.post_id=?
         * Fetch from Post entity side > 8< PostDetailsEntity Size > 1
         * Hibernate: select postdetail0_.post_detail_id as post_det1_1_, postdetail0_.url as url2_1_ from many_to_many.post_details postdetail0_
         * Hibernate: select postentiti0_.post_detail_id as post_det2_2_0_, postentiti0_.post_id as post_id1_2_0_, postentity1_.post_id as post_id1_0_1_, postentity1_.published_date as publishe2_0_1_, postentity1_.title as title3_0_1_ from many_to_many.post_details_mapping postentiti0_ inner join many_to_many.post postentity1_ on postentiti0_.post_id=postentity1_.post_id where postentiti0_.post_detail_id=?
         * Fetch from PostDetails entity side > 14< PostEntity Size > 1
         * <<< Update from post entity side >>>
         * Hibernate: select postdetail0_.post_id as post_id1_2_0_, postdetail0_.post_detail_id as post_det2_2_0_, postdetail1_.post_detail_id as post_det1_1_1_, postdetail1_.url as url2_1_1_ from many_to_many.post_details_mapping postdetail0_ inner join many_to_many.post_details postdetail1_ on postdetail0_.post_detail_id=postdetail1_.post_detail_id where postdetail0_.post_id=?
         * <<< Update from post entity side End >>>
         * <<< Update from postDetails entity side >>>
         * Hibernate: select postentiti0_.post_detail_id as post_det2_2_0_, postentiti0_.post_id as post_id1_2_0_, postentity1_.post_id as post_id1_0_1_, postentity1_.published_date as publishe2_0_1_, postentity1_.title as title3_0_1_ from many_to_many.post_details_mapping postentiti0_ inner join many_to_many.post postentity1_ on postentiti0_.post_id=postentity1_.post_id where postentiti0_.post_detail_id=?
         * Hibernate: update many_to_many.post set published_date=?, title=? where post_id=?
         * Hibernate: update many_to_many.post_details set url=? where post_detail_id=?
         * <<< Update from postDetails entity side End >>>
         *
         * */
    }
}
