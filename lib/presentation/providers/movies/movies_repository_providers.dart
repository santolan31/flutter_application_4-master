import 'package:flutter_application_4/infraestructure/datasources/moviedb_datasource.dart';
import 'package:flutter_application_4/infraestructure/repositorys/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// este repository es de solo lectura ;
final movieRepositoryProvider = Provider((ref) {
  return MovierepositoryImpl(MovieDatasource());
});
