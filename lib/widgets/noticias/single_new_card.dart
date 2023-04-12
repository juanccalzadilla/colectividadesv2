import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostur_v2/models/_models.dart';

class SingleNewCard extends StatelessWidget {
  final Noticia noticia;

  const SingleNewCard({super.key, required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(0.1), // Color y opacidad de la sombra
            blurRadius: 4, // Radio del desenfoque de la sombra
            spreadRadius: 1, // Distancia de expansión de la sombra
            offset:
                const Offset(0, 2), // Desplazamiento de la sombra en eje x e y
          ),
        ],
      ),
      // height: size.height * 0.3,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SigleNewCardImage(
            noticia: noticia,
          ),
          const SizedBox(
            height: 10,
          ),
          _SingleNewCardBody(
            noticia: noticia,
          )
        ],
      ),
    );
  }
}

class _SingleNewCardBody extends StatelessWidget {
  final Noticia noticia;

  const _SingleNewCardBody({required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  noticia.titulo,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  noticia.subTitulo,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                _SingleCardButtons(
                  noticia: noticia,
                )
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_sharp)
        ],
      ),
    );
  }
}

class _SingleCardButtons extends StatelessWidget {
  final Noticia noticia;

  const _SingleCardButtons({required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SingleCardButton(
            icon: Icons.remove_red_eye_outlined,
            color: Colors.blue,
            numero: noticia.impresiones.toString(),
          ),
          const _SingleCardButton(
            icon: Icons.favorite_border_outlined,
            color: Colors.redAccent,
            numero: '10',
          ),
          const _SingleCardButton(
            icon: Icons.comment,
            color: Colors.green,
            numero: '20',
          ),
          const _SingleCardButton(
            icon: Icons.share_outlined,
            color: Colors.black,
            numero: '1',
          ),
        ],
      ),
    );
  }
}

class _SingleCardButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String numero;

  const _SingleCardButton(
      {required this.icon, required this.color, required this.numero});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(
          width: 5,
        ),
        Text(
          numero,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}

class _SigleNewCardImage extends StatelessWidget {
  final Noticia noticia;

  const _SigleNewCardImage({required this.noticia});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black
            .withOpacity(0.1), // Color y opacidad del borde inferior
        width: 1, // Ancho del borde inferior
      ))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: CachedNetworkImage(
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage('assets/pacman_loading.gif')),
            placeholder: (context, url) =>
                const Image(image: AssetImage('assets/pacman_loading.gif')),
            height: 130,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: noticia.img),
      ),
    );
  }
}
