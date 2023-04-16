import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hostur_v2/helpers/url_launcher.dart';
import 'package:hostur_v2/models/_models.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class RecetasSingleScreen extends StatelessWidget {
  const RecetasSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Receta receta = ModalRoute.of(context)?.settings.arguments as Receta;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _DetailedImage(size: size, receta: receta),
            _BottomSheet(
              size: size,
              receta: receta,
            )
          ],
        ),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({
    required this.size,
    required this.receta,
  });

  final Size size;
  final Receta receta;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> adjuntosReceta = receta.getAdjuntos;
    return Positioned(
        bottom: 0,
        child: ElasticIn(
          child: Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        receta.titulo,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HtmlWidget(receta.texto,
                          onTapUrl: (p0) =>
                              launchInBrowser(p0), //p0.sources.first.url
                          onTapImage: (p0) =>
                              launchInBrowser(p0.sources.first.url)),
                      const SizedBox(
                        height: 10,
                      ),
                      if (adjuntosReceta.isNotEmpty)
                        _AdjuntosReceta(
                            size: size,
                            adjuntosReceta: adjuntosReceta,
                            receta: receta)
                    ],
                  ),
                ),
              )),
        ));
  }
}

class _AdjuntosReceta extends StatelessWidget {
  const _AdjuntosReceta({
    required this.size,
    required this.adjuntosReceta,
    required this.receta,
  });

  final Size size;
  final List<Map<String, String>> adjuntosReceta;
  final Receta receta;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Adjuntos'),
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          width: size.width * 1,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: adjuntosReceta.length,
            itemBuilder: (context, index) => IconButton(
                onPressed: () =>
                    launchInBrowser(adjuntosReceta[index]['enlace']),
                icon: Icon(receta.getIcono(adjuntosReceta[index]['tipo']),
                    size: 50)),
          ),
        ),
      ],
    );
  }
}

class _DetailedImage extends StatelessWidget {
  const _DetailedImage({
    required this.size,
    required this.receta,
  });

  final Size size;
  final Receta receta;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: size.height - 200,
            width: size.width,
            child: Hero(
              tag: 'img-receta-${receta.idReceta}',
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CachedNetworkImage(
                  alignment: Alignment.center,
                  imageUrl: receta.img,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Image(
                      image: AssetImage('assets/pacman_loading.gif')),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: FadeIn(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
