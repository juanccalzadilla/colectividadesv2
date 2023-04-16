import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostur_v2/models/_models.dart';
import 'package:hostur_v2/provider/desafios_provider.dart';

class DesafiosScreen extends StatelessWidget {
  const DesafiosScreen({Key? key}) : super(key: key);

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
                '#HosturTeReta',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
            ),
            Expanded(child: _DesafiosContenido(size: size))
          ],
        ));
  }
}

class _DesafiosContenido extends StatefulWidget {
  const _DesafiosContenido({
    required this.size,
  });

  final Size size;

  @override
  State<_DesafiosContenido> createState() => _DesafiosContenidoState();
}

class _DesafiosContenidoState extends State<_DesafiosContenido> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final desafiosProvider =
          Provider.of<DesafiosProvider>(context, listen: false);

      _scrollController.addListener(() {
        if ((_scrollController.position.pixels + 100) >=
            _scrollController.position.maxScrollExtent) {
          desafiosProvider.getDesafios();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final desafiosProvider = Provider.of<DesafiosProvider>(context);
    return ListView.builder(
      controller: _scrollController,
      itemCount: desafiosProvider.desafiosList.length,
      itemBuilder: (context, index) => _RecetaCard(
          widget: widget, desafio: desafiosProvider.desafiosList[index]),
    );
  }
}

class _RecetaCard extends StatelessWidget {
  const _RecetaCard({
    required this.widget,
    required this.desafio,
  });

  final Desafio desafio;
  final _DesafiosContenido widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'desafiosSingle', arguments: desafio),
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
                  tag: 'img-desafio-${desafio.idDesafio}',
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: desafio.img),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desafio.titulo,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(desafio.subTitulo)
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
