
import 'package:flutter_application_4/domain/entities/movie.dart';

abstract class MoviesRepository {


  Future<List<Movie>>getNowplaying({int page = 1 });

}