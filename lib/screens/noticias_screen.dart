import 'package:flutter/material.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
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
        itemBuilder: (context, index) => SingleNewCard(
              noticia: noticiasList.noticiasList[index],
            ));
  }
}
