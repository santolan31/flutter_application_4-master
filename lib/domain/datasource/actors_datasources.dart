import 'package:flutter_application_4/domain/entities/actor_cast.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorByMovie(String movieId); 
}
