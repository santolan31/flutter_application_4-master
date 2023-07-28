import 'package:dio/dio.dart';
import 'package:flutter_application_4/config/constants/enviroment.dart';
import 'package:flutter_application_4/domain/datasource/movies_datasource.dart';
import 'package:flutter_application_4/domain/entities/movie.dart';
import 'package:flutter_application_4/infraestructure/mappers/movie_mapper.dart';
import 'package:flutter_application_4/infraestructure/models/moviedb/moviedb_response.dart';

class MovieDatasource extends MoviesDataSources {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": EnvironMent.movieDbKey,
        "language": "es-Es"
      }));

  @override
  Future<List<Movie>> getNowplaying({int page = 1}) async {
    final response = await dio.get("/movie/now_playing");
    final movieDBRresponse = MovieDbresponse.fromJson(response.data);


    final List<Movie> movies = movieDBRresponse.results
      .where((movieDB) => movieDB.posterPath != "no posterpath ")
        .map((movieDB) => MovieMaper.movieDbToEntity(movieDB))
        .toList();
    return movies;
  }
}
