import 'package:flutter/material.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
import '../widgets/_widgets.dart';

class NoticiasScreen extends StatelessWidget {
  const NoticiasScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final appTheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FilledButton.tonal(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                        _LoginModal(size: size, appTheme: appTheme),
                  );
                },
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 33,
                  color: appTheme.primary,
                )),
          ),
        ],
        title: const Image(
            width: 100,
            height: 100,
            fit: BoxFit.contain,
            image: AssetImage('assets/logo_superior.png')),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            '#HosturNoticiero',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black),
          ),
        ),
        Expanded(child: _NoticiasContenido()),
      ]),
    );
  }
}

class _LoginModal extends StatelessWidget {
  const _LoginModal({
    required this.size,
    required this.appTheme,
  });

  final Size size;
  final ColorScheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.asset('assets/Hosturcitos_Cubiertos.png', height: 100),
          Text('Hostur Contigo',
              style: TextStyle(
                  fontSize: 20,
                  color: appTheme.primary,
                  fontWeight: FontWeight.bold)),
          Text('Acceso para padres',
              style: TextStyle(fontSize: 15, color: appTheme.secondary)),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10)))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Contraseña',
                label: Text('Contraseña'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10)))),
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton.tonal(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(size.width, 50))),
              onPressed: () {},
              child: Text(
                'Entrar',
                style: TextStyle(color: appTheme.secondary),
              )),

              const SizedBox(height: 20,),
              const Text('¿Olvidaste la contraseña?'),
              const SizedBox(height: 10,),

              FilledButton.tonal(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(size.width, 50))),
              onPressed: () {},
              child: Text(
                'Recuperar contraseña',
                style: TextStyle(color: appTheme.secondary),
              )),
              const SizedBox(height: 20,),
              const Text('Solicitar acceso'),
              const SizedBox(height: 10,),

              FilledButton.tonal(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(size.width, 50))),
              onPressed: () {},
              child: Text(
                'Solicitar',
                style: TextStyle(color: appTheme.secondary),
              ))
        ]),
      ),
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
