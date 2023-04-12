import 'package:flutter/material.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
import 'package:provider/provider.dart';

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
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: kPrimaryColor),
              elevation: 0,
              backgroundColor: const Color(0xFFFAFAFA))),
      routes: {'noticias': (context) => const NoticiasScreen()},
    );
  }
}
