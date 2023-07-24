import 'package:flutter_application_4/presentation/providers/movies/movies_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<Moviesnotifier, List<Movie>>((ref) {
    final  fetchMoremovies = ref.watch(movieRepositoryProvider).getNowplaying;  

  return Moviesnotifier(
    fetchMoreMovies: fetchMoremovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class Moviesnotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  Moviesnotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    // state <----
  }
}
