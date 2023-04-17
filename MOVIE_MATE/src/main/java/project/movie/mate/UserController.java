package project.movie.mate;

import org.springframework.stereotype.Controller;

import dao.MovieMate_UserDAO;

@Controller
public class UserController {

	MovieMate_UserDAO moviemate_userdao;

	public UserController(MovieMate_UserDAO moviemate_userdao) {
		this.moviemate_userdao = moviemate_userdao;
	}
}
