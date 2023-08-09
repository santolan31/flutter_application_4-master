import '../entities/actor_cast.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorByMovie(String movieId); 
}