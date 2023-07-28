import 'package:flutter_application_4/domain/entities/movie.dart';
import 'package:flutter_application_4/presentation/providers/movie/movies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMvoies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMvoies.isEmpty) return [];

  return nowPlayingMvoies.sublist(0, 6);
});
