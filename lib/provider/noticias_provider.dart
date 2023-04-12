import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostur_v2/models/_models.dart';
import 'package:hostur_v2/models/noticias_response.dart';
import 'package:http/http.dart' as http;

class NoticiasProvider extends ChangeNotifier {
  final String _domain = 'https://hosturcontigo.es/endpoints/getNoticias.php';
  final String _action = 'getNoticias';
  int page = 0;

  List<Noticia> noticiasList = [];

  NoticiasProvider() {
    getNoticias();
  }

  getNoticias() async {
    
    Map<String, dynamic> body = {
      // Aquí puedes especificar los datos que deseas enviar en el cuerpo de la petición
      'pagina': '$page',
      'accion': _action,
    };
    
    page++;
    // var url = Uri.parse(_domain);
    final response = await http.post(Uri.parse(_domain), body: body);

    final noticias = NoticiasResponse.fromJson(json.decode(response.body));

    noticiasList = [...noticiasList ,...noticias.noticias];

    

    notifyListeners();
  }
}
