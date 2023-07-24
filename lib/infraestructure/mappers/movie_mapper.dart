import 'package:flutter_application_4/domain/entities/movie.dart';
import 'package:flutter_application_4/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMaper {
  static Movie movieDbToEntity(MovieMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath!= "")?
      "https://image.tmdb.org/t/p/w500${movieDB.backdropPath}":"https://media.istockphoto.com/id/924949200/vector/404-error-page-or-file-not-found-icon.jpg?s=170667a&w=0&k=20&c=gsR5TEhp1tfg-qj1DAYdghj9NfM0ldfNEMJUfAzHGtU=",
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath!="")?
      "https://image.tmdb.org/t/p/w500${movieDB.posterPath}":
      "no poster",
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);
}
