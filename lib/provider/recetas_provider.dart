import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hostur_v2/models/recetas_response.dart';
export 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:hostur_v2/models/_models.dart';

class RecetasProvider extends ChangeNotifier {
  final String _domain = 'https://hosturcontigo.es/endpoints/getRecetas.php';
  final String _action = 'getRecetas';
  int page = 0;
  bool verMas = true;

  List<Receta> recetasList = [];

  RecetasProvider() {
    getRecetas();
  }

  getRecetas() async {
    if (!verMas) return;
    Map<String, dynamic> body = {
      // Aquí puedes especificar los datos que deseas enviar en el cuerpo de la petición
      'pagina': '$page',
      'accion': _action,
    };

    page++;

    final response = await http.post(Uri.parse(_domain), body: body);

    final recetas = RecetasResponse.fromJson(json.decode(response.body));

    recetasList = [...recetasList, ...recetas.recetas];
    verMas = recetas.verMas;
    notifyListeners();
  }
}
