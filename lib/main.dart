import 'package:flutter/material.dart';
import 'package:hostur_v2/provider/desafios_provider.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
import 'package:hostur_v2/provider/recetas_provider.dart';
import 'package:hostur_v2/provider/ui_provider.dart';
import 'package:hostur_v2/screens/noticias_single_screen.dart';
import 'package:hostur_v2/screens/recetas_single_screen.dart';

import 'screens/_screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NoticiasProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => UIProvider()),
        ChangeNotifierProvider(create: (_) => RecetasProvider()),
        ChangeNotifierProvider(create: (_) => DesafiosProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final kPrimaryColor = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostur V2',
      debugShowCheckedModeBanner: false,
      initialRoute: 'noticias',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      routes: {
        'noticias': (context) => const MainViewScreen(),
        'noticiaSingle': (context) => const NoticiasSingleScreen(),
        'recetas': (context) => const RecetasScreen(),
        'recetaSingle': (context) => const RecetasSingleScreen(),
        'desafios': (context) => const DesafiosScreen(),
        'desafiosSingle': (context) => const DesafiosSingleScreen()
      },
    );
  }
}
