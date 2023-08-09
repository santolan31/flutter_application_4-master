import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/domain/entities/movie.dart';
import 'package:go_router/go_router.dart';

class MoviesSlideshow extends StatelessWidget {
  const MoviesSlideshow({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
          pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 0),
              builder: DotSwiperPaginationBuilder(
                  activeColor: colors.primary, color: colors.secondary)),
          scale: 0.9,
          viewportFraction: 0.8,
          itemCount: movies.length,
          autoplay: true,
          itemBuilder: (context, index) => _SlideControl(movie: movies[index])),
    );
  }
}

class _SlideControl extends StatelessWidget {
  final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
      ]);

  final Movie movie;
  _SlideControl({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12));
                }
                return GestureDetector(
                  onTap: () => context.push("/movie/${movie.id}"),
                  child: FadeIn(child: child));
              },
            ),
          )),
    );
  }
}
