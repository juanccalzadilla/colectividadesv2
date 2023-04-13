import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostur_v2/models/_models.dart';

class NoticiasSingleScreen extends StatelessWidget {
  const NoticiasSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Noticia noticias =
        ModalRoute.of(context)?.settings.arguments as Noticia;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.topCenter,
              height: size.height - 300,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/pacman_loading.gif'))),
            ),
          ),
        ],
      ),
    );
  }
}
