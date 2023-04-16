import 'package:flutter/material.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
import 'package:hostur_v2/provider/ui_provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      onTap: (p0) {
        final uiProvider = Provider.of<UIProvider>(context, listen: false);
        uiProvider.selectedMenuOpt = p0;
      },
      currentIndex: Provider.of<UIProvider>(context).selectedMenuOpt,
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
