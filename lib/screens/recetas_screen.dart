import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostur_v2/models/_models.dart';
import 'package:hostur_v2/provider/recetas_provider.dart';

class RecetasScreen extends StatelessWidget {
  const RecetasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Image(
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              image: AssetImage('assets/logo_superior.png')),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '#HosturCocina',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
            ),
            Expanded(child: _RecetasContenido(size: size))
          ],
        ));
  }
}

class _RecetasContenido extends StatefulWidget {
  const _RecetasContenido({
    required this.size,
  });

  final Size size;

  @override
  State<_RecetasContenido> createState() => _RecetasContenidoState();
}

class _RecetasContenidoState extends State<_RecetasContenido> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final recetasProvider =
          Provider.of<RecetasProvider>(context, listen: false);

      _scrollController.addListener(() {
        if ((_scrollController.position.pixels + 100) >=
            _scrollController.position.maxScrollExtent) {
          recetasProvider.getRecetas();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final recetasProvider = Provider.of<RecetasProvider>(context);
    return ListView.builder(
      controller: _scrollController,
      itemCount: recetasProvider.recetasList.length,
      itemBuilder: (context, index) => _RecetaCard(
          widget: widget, receta: recetasProvider.recetasList[index]),
    );
  }
}

class _RecetaCard extends StatelessWidget {
  const _RecetaCard({
    required this.widget,
    required this.receta,
  });

  final Receta receta;
  final _RecetasContenido widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'recetaSingle', arguments: receta),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(0.1), // Color y opacidad de la sombra
              blurRadius: 4, // Radio del desenfoque de la sombra
              spreadRadius: 1, // Distancia de expansión de la sombra
              offset: const Offset(
                  0, 2), // Desplazamiento de la sombra en eje x e y
            ),
          ],
        ),
        // height: size.height * 0.3,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: widget.size.width * 0.3,
              height: widget.size.height * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: 'img-receta-${receta.idReceta}',
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: receta.img),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receta.titulo,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Receta · ${receta.tiempo} · ${receta.dificultad}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
