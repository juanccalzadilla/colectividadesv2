import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hostur_v2/helpers/url_launcher.dart';
import 'package:hostur_v2/models/_models.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NoticiasSingleScreen extends StatelessWidget {
  const NoticiasSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Noticia noticia =
        ModalRoute.of(context)?.settings.arguments as Noticia;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _DetailedImage(size: size, noticia: noticia),
            _BottomSheet(
              size: size,
              noticia: noticia,
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
    required this.noticia,
  });

  final Size size;
  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> adjuntosNoticia = noticia.getAdjuntos;
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
                        noticia.titulo,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        noticia.subTitulo,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HtmlWidget(noticia.texto,
                          onTapUrl: (p0) =>
                              launchInBrowser(p0), //p0.sources.first.url
                          onTapImage: (p0) =>
                              launchInBrowser(p0.sources.first.url)),
                      const SizedBox(
                        height: 10,
                      ),
                      if (adjuntosNoticia.isNotEmpty)
                        _AdjuntosNoticia(
                            size: size,
                            adjuntosNoticia: adjuntosNoticia,
                            noticia: noticia)
                    ],
                  ),
                ),
              )),
        ));
  }
}

class _AdjuntosNoticia extends StatelessWidget {
  const _AdjuntosNoticia({
    required this.size,
    required this.adjuntosNoticia,
    required this.noticia,
  });

  final Size size;
  final List<Map<String, String>> adjuntosNoticia;
  final Noticia noticia;

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
            itemCount: adjuntosNoticia.length,
            itemBuilder: (context, index) => IconButton(
                onPressed: () =>
                    launchInBrowser(adjuntosNoticia[index]['enlace']),
                icon: Icon(noticia.getIcono(adjuntosNoticia[index]['tipo']),
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
    required this.noticia,
  });

  final Size size;
  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        alignment: Alignment.topCenter,
        height: size.height - 200,
        width: size.width,
        child: Hero(
          tag: 'img-noticia-${noticia.idNoticia}',
          child: CachedNetworkImage(
            alignment: Alignment.center,
            imageUrl: noticia.img,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage('assets/pacman_loading.gif')),
          ),
        ),
      ),
    );
  }
}
