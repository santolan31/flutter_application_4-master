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
    ref.read(nowPopulargMoviesProvider.notifier).loadNextPage();
    ref.read(nowUpcoming.notifier).loadNextPage();
    ref.read(nowToprate.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialloading = ref.watch(initalLoadinProvider);
    if (initialloading) return const FullscreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(nowPopulargMoviesProvider);
    final upComing = ref.watch(nowUpcoming);
    final topRated = ref.watch(nowToprate);

  
    return Visibility(
      visible: !initialloading,
      child: CustomScrollView(slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero, title: CustomAppBar()),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(
                movies: slideShowMovies,
              ),
              HorizontalListview(
                movies: nowPlayingMovies,
                label: "En cines",
                subtitle: "lunes",
                loadNextmovie: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              HorizontalListview(
                movies: upComing,
                label: "Estrenos",
                subtitle: "Agosto",
                loadNextmovie: () {
                  ref.read(nowUpcoming.notifier).loadNextPage();
                },
              ),
              HorizontalListview(
                movies: popularMovies,
                label: "Mas populares",
                subtitle: "2023",
                loadNextmovie: () {
                  ref.read(nowPopulargMoviesProvider.notifier).loadNextPage();
                },
              ),
              HorizontalListview(
                movies: topRated,
                label: "Top rate",
                // subtitle: "",
                loadNextmovie: () {
                  ref.read(nowToprate.notifier).loadNextPage();
                },
              ),
            ],
          );
        }, childCount: 1))
      ]),
    );
  }
}
