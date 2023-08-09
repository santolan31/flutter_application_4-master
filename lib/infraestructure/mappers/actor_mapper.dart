import 'package:flutter_application_4/domain/entities/actor_cast.dart';
import 'package:flutter_application_4/infraestructure/models/moviedb/movie_actors_details.dart';

class ActorMapper {
  static Actor castToentity(Cast cast) =>
      Actor(
        id: cast.id,
         name: cast.name, 
         profilePath: cast.profilePath != null ? "https://image.tmdb.org/t/p/w500${cast.profilePath}":
         "https://media.istockphoto.com/id/924949200/vector/404-error-page-or-file-not-found-icon.jpg?s=170667a&w=0&k=20&c=gsR5TEhp1tfg-qj1DAYdghj9NfM0ldfNEMJUfAzHGtU="
          , 
         character: cast.character);
}
