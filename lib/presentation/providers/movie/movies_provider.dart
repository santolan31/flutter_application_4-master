import 'package:flutter_application_4/presentation/providers/movie/movies_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<Moviesnotifier, List<Movie>>((ref) {
  final fetchMoremovies = ref.watch(movieRepositoryProvider).getNowplaying;

  return Moviesnotifier(fetchMoreMovies: fetchMoremovies);
});

final nowPopulargMoviesProvider =
    StateNotifierProvider<Moviesnotifier, List<Movie>>((ref) {
  final fetchMoremovies = ref.watch(movieRepositoryProvider).getNowpopular;

  return Moviesnotifier(fetchMoreMovies: fetchMoremovies);
});

final nowUpcoming =
    StateNotifierProvider<Moviesnotifier, List<Movie>>((ref) {
  final fetchMoremovies = ref.watch(movieRepositoryProvider).getUpcoming;

  return Moviesnotifier(fetchMoreMovies: fetchMoremovies);
});

final nowToprate =
    StateNotifierProvider<Moviesnotifier, List<Movie>>((ref) {
  final fetchMoremovies = ref.watch(movieRepositoryProvider).getToprate;

  return Moviesnotifier(fetchMoreMovies: fetchMoremovies);
});


typedef MovieCallback = Future<List<Movie>> Function({int page});

class Moviesnotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  bool isloading = false;

  Moviesnotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    if (isloading) return;
    isloading = true;
    state = [...state, ...movies];
    isloading = false;

    // state <----
  }
}
