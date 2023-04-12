import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      onTap: (p0) {
        setState(() {
          _currentIndex = p0;
        });
      },
      
      currentIndex: _currentIndex,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.newspaper_outlined),
          title: const Text("Noticias"),
          selectedColor: Colors.purple,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.soup_kitchen_outlined),
          title: const Text("Recetas"),
          selectedColor: Colors.pink,
        ),

        SalomonBottomBarItem(
          icon: const Icon(Icons.extension),
          title: const Text("Desafios"),
          selectedColor: Colors.redAccent,
        ),

        SalomonBottomBarItem(
          icon: const Icon(Icons.school_rounded),
          title: const Text("Mi cole"),
          selectedColor: Colors.greenAccent,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.restaurant),
          title: const Text("Comedor"),
          selectedColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
