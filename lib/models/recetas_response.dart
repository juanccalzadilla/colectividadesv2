import 'dart:convert';
import 'package:hostur_v2/models/_models.dart';

RecetasResponse recetasResponseFromJson(String str) => RecetasResponse.fromJson(json.decode(str));

String recetasResponseToJson(RecetasResponse data) => json.encode(data.toJson());

class RecetasResponse {
    RecetasResponse({
        required this.recetas,
        required this.verMas,
        required this.result,
    });

    List<Receta> recetas;
    bool verMas;
    String result;

    factory RecetasResponse.fromJson(Map<String, dynamic> json) => RecetasResponse(
        recetas: List<Receta>.from(json["recetas"].map((x) => Receta.fromJson(x))),
        verMas: json["verMas"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "recetas": List<dynamic>.from(recetas.map((x) => x.toJson())),
        "verMas": verMas,
        "result": result,
    };
}

