import 'package:dio/dio.dart';
import 'package:flutter_application_4/config/constants/enviroment.dart';
import 'package:flutter_application_4/domain/datasource/movies_datasource.dart';
import 'package:flutter_application_4/domain/entities/movie.dart';
import 'package:flutter_application_4/infraestructure/mappers/movie_mapper.dart';
import 'package:flutter_application_4/infraestructure/models/moviedb/movie_details.dart';
import 'package:flutter_application_4/infraestructure/models/moviedb/moviedb_response.dart';

class MovieDatasource extends MoviesDataSources {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": EnvironMent.movieDbKey,
        "language": "es-Es"
      }));

  List<Movie> _jsonMovies(Map<String, dynamic> json) {
    final movieDBRresponse = MovieDbresponse.fromJson(json);

    final List<Movie> movies = movieDBRresponse.results
        .where((movieDB) => movieDB.posterPath != "no posterpath ")
        .map((movieDB) => MovieMaper.movieDbToEntity(movieDB))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowplaying({int page = 1}) async {
    final response =
        await dio.get("/movie/now_playing", queryParameters: {"page": page});

    return _jsonMovies(response.data);
  }

  @override
  Future<List<Movie>> getNowpopular({int page = 1}) async {
    final response =
        await dio.get("/movie/popular", queryParameters: {"page": page});

    return _jsonMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get("/movie/upcoming", queryParameters: {"page": page});

    return _jsonMovies(response.data);
  }

  @override
  Future<List<Movie>> getToprate({int page = 1}) async {
    final response =
        await dio.get("/movie/top_rated", queryParameters: {"page": page});

    return _jsonMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get(
      "/movie/$id",
    );
    if (response.statusCode != 200)throw Exception("movie whit id:$id no have found  ");

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMaper.moviedBdetailToEntity(movieDetails);

    return movie;
  }
}
