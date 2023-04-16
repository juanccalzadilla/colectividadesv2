import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
  
    viewController.jumpToPage(_selectedMenuOpt);
    notifyListeners();
  }

  final viewController = PageController(
    initialPage: 0,
  );
}
