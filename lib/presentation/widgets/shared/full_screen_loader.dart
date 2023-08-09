import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  const FullscreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final texstyle = Theme.of(context).textTheme;
    final messages = <String>[
      "Cargando Peliculas 😅",
      "Comprando Palomitas 🍿",
      "Cargando Populares 😎",
      "Cargando Peliculas 📽️",
      "Ya mero... 😒",
      "Cargando Peliculas 😶‍🌫️",
    ];

    Stream<String> getLoadingMessages() {
      return Stream.periodic(const Duration(milliseconds: 1200), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Container(
      color: Colors.white12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Loading",
              style: texstyle.bodyMedium,
            ),
            const SizedBox(
              height: 15,
            ),
             CircularProgressIndicator(
              color: Colors.blue.shade500,
              strokeWidth: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("Cargando...");
                return Text(
                  snapshot.data!,
                  style: texstyle.bodySmall,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
