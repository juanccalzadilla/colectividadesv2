import 'package:flutter/material.dart';
import 'package:hostur_v2/models/_models.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/_widgets.dart';

class NoticiasScreen extends StatelessWidget {
  const NoticiasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.camera),
        title: const Image(
            width: 100,
            height: 100,
            fit: BoxFit.contain,
            image: AssetImage('assets/logo_superior.png')),
        centerTitle: true,
      ),
      bottomNavigationBar: const CustomBottomBar(),
      body: Stack(children: [
        // const Background(),
        _NoticiasContenido(),
      ]),
    );
  }
}

class _NoticiasContenido extends StatefulWidget {
  @override
  State<_NoticiasContenido> createState() => _NoticiasContenidoState();
}

class _NoticiasContenidoState extends State<_NoticiasContenido> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final noticiasList = Provider.of<NoticiasProvider>(context, listen: false);

    _scrollController.addListener(() {
      if ((_scrollController.position.pixels + 400) >=
          _scrollController.position.maxScrollExtent) {
        noticiasList.getNoticias();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noticiasList = Provider.of<NoticiasProvider>(context);

    return ListView.builder(
        itemCount: noticiasList.noticiasList.length,
        controller: _scrollController,
        itemBuilder: (context, index) => _SingleNewCard(
              noticia: noticiasList.noticiasList[index],
            ));
  }
}

class _SingleNewCard extends StatelessWidget {
  final Noticia noticia;

  const _SingleNewCard({required this.noticia});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      height: size.height * 0.3,
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
                _SingleCardButtons()
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _SingleCardButton(
          icon: Icons.remove_red_eye_outlined,
          color: Colors.blue,
          numero: '600',
        ),
        _SingleCardButton(
          icon: Icons.favorite_border_outlined,
          color: Colors.redAccent,
          numero: '10',
        ),
        _SingleCardButton(
          icon: Icons.comment,
          color: Colors.green,
          numero: '20',
        ),
        _SingleCardButton(
          icon: Icons.share_outlined,
          color: Colors.black,
          numero: '1',
        ),
      ],
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
        child: FadeInImage(
            placeholder: const AssetImage('assets/pacman_loading.gif'),
            placeholderFit: BoxFit.cover,
            height: 130,
            width: double.infinity,
            fit: BoxFit.cover,
            image: NetworkImage(noticia.img)),
      ),
    );
  }
}
