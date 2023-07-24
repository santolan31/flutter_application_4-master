import 'package:flutter/material.dart';
import 'package:flutter_application_4/presentation/providers/movies/movies_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("HomeScreen"),
        ),
        body: _ViewMovies());
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
    return Placeholder();
  }
}
