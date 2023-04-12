import 'dart:convert';

import 'package:hostur_v2/models/_models.dart';

NoticiasResponse noticiasResponseFromJson(String str) => NoticiasResponse.fromJson(json.decode(str));

class NoticiasResponse {
    NoticiasResponse({
        required this.noticias,
        required this.verMas,
        required this.result,
    });

    List<Noticia> noticias;
    bool verMas;
    String result;

    factory NoticiasResponse.fromJson(Map<String, dynamic> json) => NoticiasResponse(
        noticias: List<Noticia>.from(json["noticias"].map((x) => Noticia.fromJson(x))),
        verMas: json["verMas"],
        result: json["result"],
    );
}

