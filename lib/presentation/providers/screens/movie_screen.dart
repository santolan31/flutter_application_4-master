import 'package:flutter/material.dart';
import 'package:flutter_application_4/presentation/providers/movie/movie_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({
    super.key,
    required this.movieId,
  });
  static const name = "movie-screen";

  final String movieId;

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(movieinfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movies = ref.watch(movieinfoProvider)[widget.movieId];
    if (movies == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppbar(movie: movies),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _Movieview(
                        movie: movies,
                      ),
                  childCount: 1))
        ],
      ),
    );
  }
}

class _Movieview extends StatelessWidget {
  const _Movieview({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    
   
   
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(borderRadius: BorderRadius.circular(8),
            child: Image.network(movie.posterPath,width: size.width *0.3),
          
            

          ),

         const SizedBox(width: 10),

         SizedBox(
          width: (size.width -40)*0.7 ,
          child: Column(
            children: [
              Text(movie.title,style: textStyle.bodyMedium,),
              SizedBox(height: 5,),
              Text(movie.overview , style: textStyle.bodyMedium,),
               
            ],
          )
         )

          ],
        ),),
   

    Padding(padding: const EdgeInsets.all(8),
    child: Wrap(
      children: [
        ...movie.genreIds.map((gender) => Container(
          margin: const EdgeInsets.only(right: 10
          ),
          child: Chip(label: Text(gender),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
          
          ),
          
          ),


        ))

      ],
    ),
    ),          

     const SizedBox(height:100 ,), 
     
     
      
     
     
     ],

     
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {
  const _CustomSliverAppbar({required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Stack(
            children: [
              SizedBox.expand(
                  child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              )),
              const SizedBox.expand(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            stops: [0.8, 1.0],
                            colors: [Colors.transparent, Colors.black]))),
              )
            ],
          )),
      actions: [],
    );
  }
}
