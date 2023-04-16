import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hostur_v2/models/desafios_response.dart';
export 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:hostur_v2/models/_models.dart';

class DesafiosProvider extends ChangeNotifier {
  final String _domain = 'https://hosturcontigo.es/endpoints/getDesafios.php';
  final String _action = 'getDesafios';
  int page = 0;
  bool verMas = true;

  List<Desafio> desafiosList = [];

  DesafiosProvider() {
    getDesafios();
  }

  getDesafios() async {
    if (!verMas) return;
    Map<String, dynamic> body = {
      // Aquí puedes especificar los datos que deseas enviar en el cuerpo de la petición
      'pagina': '$page',
      'accion': _action,
    };
    page++;
    final response = await http.post(Uri.parse(_domain), body: body);
    final desafios = DesafiosResponse.fromJson(json.decode(response.body));

    desafiosList = [...desafiosList, ...desafios.desafios];
    verMas = desafios.verMas;
    notifyListeners();
  }
}
