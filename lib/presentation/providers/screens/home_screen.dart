import 'package:flutter_application_4/presentation/widgets/shared/custombutton_navigation.dart';

import '../../widgets/widgets.dart';
import '../movie/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ViewMovies(),
      bottomNavigationBar: CustomButoonNavigation(),
    );
  }
}

class _ViewMovies extends ConsumerStatefulWidget {
  const _ViewMovies();

  @override
  _ViewMoviesState createState() => _ViewMoviesState();
}

class _ViewMoviesState extends ConsumerState<_ViewMovies> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: slideShowMovies, ),
        HorizontalListview(movies: nowPlayingMovies,label: "En cines",
        subtitle: "lunes"
        
        )
      ],
    );
  }
}
