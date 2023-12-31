import 'package:flutter_application_4/domain/datasource/movies_datasource.dart';
import 'package:flutter_application_4/domain/entities/movie.dart';
import 'package:flutter_application_4/domain/repository/movies_repository.dart';

class MovierepositoryImpl extends MoviesRepository {
  final MoviesDataSources datasource;

  MovierepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowplaying({int page = 1}) {
    return datasource.getNowplaying(page: page);
  }

  @override
  Future<List<Movie>> getNowpopular({int page = 1}) {
    return datasource.getNowpopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  Future<List<Movie>> getToprate({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
}
// 