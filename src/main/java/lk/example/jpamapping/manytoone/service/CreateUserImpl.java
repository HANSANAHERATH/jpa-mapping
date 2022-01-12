package lk.example.jpamapping.manytoone.service;

import lk.example.jpamapping.manytoone.entity.MobileEntity;
import lk.example.jpamapping.manytoone.entity.UserEntity;
import lk.example.jpamapping.manytoone.repository.MobileRepository;
import lk.example.jpamapping.manytoone.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CreateUserImpl implements CreateUser {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MobileRepository mobileRepository;

    @Override
    public void create() {

        long random = (long)(Math.random()*(1000-0+1)+0);

        System.out.println("Start saving one-to-many relationship");

        UserEntity userEntity = new UserEntity();
        userEntity.setName("name " + random);

        List<MobileEntity> mobileEntities = new ArrayList<>();

        MobileEntity mobileEntity1 = new MobileEntity();
        mobileEntity1.setMobileNo("Mobile " + (long)(Math.random()*(1000-0+1)+0));
        mobileEntities.add(mobileEntity1);

        MobileEntity mobileEntity2 = new MobileEntity();
        mobileEntity2.setMobileNo("Mobile " + (long)(Math.random()*(1000-0+1)+0));
        mobileEntities.add(mobileEntity2);

        userEntity.setMobileEntities(mobileEntities);
        userRepository.save(userEntity);

        System.out.println("Saving one-to-many relationship success");

        List<UserEntity> userEntities = userRepository.findAll();
        System.out.println("<< Fetch from user entity side >> " + userEntities.size() + " << Mobile entity size >> " + userEntities.get(0).getMobileEntities().size());

        List<MobileEntity> mobileEntityList = mobileRepository.findAll();
        System.out.println("<< Fetch from Mobile entity side >> " + mobileEntityList.size() + " << User entity id >> " + mobileEntityList.get(0).getUserEntity().getId());

        System.out.println("Update from user entity side");
        Optional<UserEntity> user = userRepository.findById((long) 2);
        user.get().getMobileEntities().get(0).setMobileNo("new Mobile");
        user.get().setName("New Name");
        userRepository.save(user.get());
        System.out.println("Update from user entity side success");

        System.out.println("Update from Mobile entity side");
        Optional<MobileEntity> mobile = mobileRepository.findById((long) 4);
        mobile.get().getUserEntity().setName("Lanka");
        mobile.get().setMobileNo("Kamals No");
        mobileRepository.save(mobile.get());
        System.out.println("Update from Mobile entity side success");

        /**
         *
         * Start saving one-to-many relationship
         * Hibernate: insert into many_to_one.user (name) values (?)
         * Hibernate: insert into many_to_one.mobile_no (mobile_no, user_id) values (?, ?)
         * Hibernate: insert into many_to_one.mobile_no (mobile_no, user_id) values (?, ?)
         * Saving one-to-many relationship success
         * Hibernate: select userentity0_.user_id as user_id1_4_, userentity0_.name as name2_4_ from many_to_one.user userentity0_
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * << Fetch from user entity side >> 11 << Mobile entity size >> 2
         * Hibernate: select mobileenti0_.mobile_id as mobile_i1_3_, mobileenti0_.mobile_no as mobile_n2_3_, mobileenti0_.user_id as user_id3_3_ from many_to_one.mobile_no mobileenti0_
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * << Fetch from Mobile entity side >> 22 << User entity id >> 1
         * Update from user entity side
         * Hibernate: select userentity0_.user_id as user_id1_4_0_, userentity0_.name as name2_4_0_, mobileenti1_.user_id as user_id3_3_1_, mobileenti1_.mobile_id as mobile_i1_3_1_, mobileenti1_.mobile_id as mobile_i1_3_2_, mobileenti1_.mobile_no as mobile_n2_3_2_, mobileenti1_.user_id as user_id3_3_2_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: select userentity0_.user_id as user_id1_4_1_, userentity0_.name as name2_4_1_, mobileenti1_.user_id as user_id3_3_3_, mobileenti1_.mobile_id as mobile_i1_3_3_, mobileenti1_.mobile_id as mobile_i1_3_0_, mobileenti1_.mobile_no as mobile_n2_3_0_, mobileenti1_.user_id as user_id3_3_0_ from many_to_one.user userentity0_ left outer join many_to_one.mobile_no mobileenti1_ on userentity0_.user_id=mobileenti1_.user_id where userentity0_.user_id=?
         * Hibernate: update many_to_one.mobile_no set mobile_no=?, user_id=? where mobile_id=?
         * Update from user entity side success
         * Update from Mobile entity side
         * Hibernate: select mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_no as mobile_n2_3_0_, mobileenti0_.user_id as user_id3_3_0_, userentity1_.user_id as user_id1_4_1_, userentity1_.name as name2_4_1_ from many_to_one.mobile_no mobileenti0_ left outer join many_to_one.user userentity1_ on mobileenti0_.user_id=userentity1_.user_id where mobileenti0_.mobile_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: select mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_, userentity1_.user_id as user_id1_4_0_, userentity1_.name as name2_4_0_ from many_to_one.mobile_no mobileenti0_ left outer join many_to_one.user userentity1_ on mobileenti0_.user_id=userentity1_.user_id where mobileenti0_.mobile_id=?
         * Hibernate: select mobileenti0_.user_id as user_id3_3_0_, mobileenti0_.mobile_id as mobile_i1_3_0_, mobileenti0_.mobile_id as mobile_i1_3_1_, mobileenti0_.mobile_no as mobile_n2_3_1_, mobileenti0_.user_id as user_id3_3_1_ from many_to_one.mobile_no mobileenti0_ where mobileenti0_.user_id=?
         * Hibernate: update many_to_one.user set name=? where user_id=?
         * Hibernate: update many_to_one.mobile_no set mobile_no=?, user_id=? where mobile_id=?
         * Update from Mobile entity side success
         *
         *
         * */
    }
}
