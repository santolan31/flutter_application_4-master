import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/helpers/human_format.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';

class HorizontalListview extends StatefulWidget {
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
  State<HorizontalListview> createState() => _HorizontalListviewState();
}

class _HorizontalListviewState extends State<HorizontalListview> {
  final scrollController = ScrollController();

  //*crear un inifinite scrrol- este debe ser un stafullwidgetg y debe
  //*dentro del extends
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextmovie == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextmovie!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  //*terminación del inifinte scrool
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          if (widget.label != null || widget.subtitle != null)
            _Title(title: widget.label, subtitle: widget.subtitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                return FadeInRight(child: _Slide(movie: widget.movies[index]));
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
    final textsyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          //* image
          children: [
            SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  width: 150,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: double.infinity),
                          child: Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 2,
                          )));
                    }
                    return GestureDetector(
                        onTap: () => context.push("/movie/${movie.id}"),
                        child: FadeIn(child: child));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: Center(
                  child: Text(
                movie.title,
                style: textsyle.titleSmall,
                maxLines: 2,
              )),
            ),
            SizedBox(
              width: 130,
              child: Row(
                children: [
                  const Icon(
                    Icons.star_half_outlined,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${movie.voteAverage}",
                    style: textsyle.bodySmall
                        ?.copyWith(color: Colors.yellow.shade800),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  // Text("${movie.popularity}",style: textsyle.bodySmall,)
                  Text(
                    HumanFormats.number(
                      movie.popularity,
                    ),
                    style: textsyle.bodySmall,
                  )
                ],
              ),
            )
          ]),
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
