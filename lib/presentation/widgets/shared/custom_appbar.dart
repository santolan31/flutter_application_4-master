import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(

        bottom: false,
        child: Padding(
            padding: const EdgeInsets.only(),
            child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            
           const SizedBox(width: 10 ,),
            Icon(
              Icons.movie_creation_outlined,
              color: colors.primary,
            ),
            const SizedBox(
              width: 5,
            ),
            Text("Cinemapedia", style: titleStyle),
            
            const SizedBox(width: 20,),
            const Spacer(),
        
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ],
        ),
            ),
          )
          );
  }
}
