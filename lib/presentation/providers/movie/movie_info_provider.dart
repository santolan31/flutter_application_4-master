import 'package:flutter_application_4/presentation/providers/movie/movies_repository_providers.dart';

import '../../../domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieinfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String,Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetmovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetmovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    
    if (state[movieId] != null) return;
print("Realizando peticion HTTP");
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
