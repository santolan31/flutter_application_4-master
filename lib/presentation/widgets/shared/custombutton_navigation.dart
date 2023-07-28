import 'package:flutter/material.dart';

class CustomButoonNavigation extends StatefulWidget {
  const CustomButoonNavigation({super.key});

  @override
  State<CustomButoonNavigation> createState() => _CustomButoonNavigationState();
}

class _CustomButoonNavigationState extends State<CustomButoonNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (onchange) {
        setState(() {
        selectedIndex = onchange;

        });
        
      },
      elevation: 0, items: [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_max,
          ),
          label: "Inicio",
          
          backgroundColor: colors.primary),
      BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: "Categorías",
          backgroundColor: colors.secondary),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline),
        label: "Favoritos",
        backgroundColor: colors.tertiary,
      ),
    ]);
  }
}
