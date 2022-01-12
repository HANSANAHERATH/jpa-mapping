package lk.example.jpamapping;

import lk.example.jpamapping.manytomany.service.CreatePost;
import lk.example.jpamapping.manytoone.service.CreateUser;
import lk.example.jpamapping.onetoone.service.RegisterBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

@SpringBootApplication
public class JpaMappingApplication {

	@Autowired
	private RegisterBookService registerBookService;

	@Autowired
	private CreatePost createPost;

	@Autowired
	private CreateUser createUser;

	public static void main(String[] args) {
		SpringApplication.run(JpaMappingApplication.class, args);
	}

	@EventListener(ApplicationReadyEvent.class)
	public void runMappings(){
		registerBookService.registerBookBiDirectional();
		createPost.save();
		createUser.create();
	}
}
