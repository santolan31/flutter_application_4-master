import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
    required this.movies,
    this.label,
    this.subtitle,
    this.loadNextmovie,
  });

  final List<Movie> movies;
  final String? label;
  final String? subtitle;
  final VoidCallback? loadNextmovie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          if (label != null || subtitle != null)
            _Title(title: label, subtitle: subtitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )));
                  }
                  return FadeInLeft(child: child);
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final tytleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: tytleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(
                  subtitle!,
                ))
        ],
      ),
    );
  }
}
