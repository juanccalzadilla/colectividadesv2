import 'package:flutter/material.dart';
import 'package:hostur_v2/provider/noticias_provider.dart';
import 'package:hostur_v2/provider/ui_provider.dart';
import 'package:hostur_v2/screens/desafios_sceen.dart';
import 'package:hostur_v2/widgets/custom_bottom_bar.dart';
import '_screens.dart';

class MainViewScreen extends StatelessWidget {
  const MainViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: uiProvider.viewController,
        onPageChanged: (value) => uiProvider.selectedMenuOpt = value,
        children: const <Widget>[
          NoticiasScreen(),
          RecetasScreen(),
          DesafiosScreen()
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
