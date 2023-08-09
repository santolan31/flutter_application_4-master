import 'package:dio/dio.dart';
import 'package:flutter_application_4/config/constants/enviroment.dart';
import 'package:flutter_application_4/domain/datasource/actors_datasources.dart';
import 'package:flutter_application_4/domain/entities/actor_cast.dart';
import 'package:flutter_application_4/infraestructure/mappers/actor_mapper.dart';
import 'package:flutter_application_4/infraestructure/models/moviedb/movie_actors_details.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": EnvironMent.movieDbKey,
        "language": "es-Es"
      }));

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get("movie/$movieId/credits");

    final castResponse = MovieActors.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToentity(cast))
        .toList();


    // TODO: implement getActorByMovie
    return actors;
  }
}
