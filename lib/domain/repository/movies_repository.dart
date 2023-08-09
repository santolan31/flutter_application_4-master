
import 'package:flutter_application_4/domain/entities/movie.dart';

abstract class MoviesRepository {


  Future<List<Movie>>getNowplaying({int page = 1 });
  Future<List<Movie>>getNowpopular({int page = 1 });
  Future<List<Movie>>getUpcoming({int page = 1 });
  Future<List<Movie>>getToprate({int page = 1 });
  Future<Movie> getMovieById( String id );  
  
}