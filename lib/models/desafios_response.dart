import 'dart:convert';

import 'package:hostur_v2/models/_models.dart';

DesafiosResponse desafiosResponseFromJson(String str) => DesafiosResponse.fromJson(json.decode(str));

String desafiosResponseToJson(DesafiosResponse data) => json.encode(data.toJson());

class DesafiosResponse {
    DesafiosResponse({
        required this.desafios,
        required this.verMas,
        required this.result,
    });

    List<Desafio> desafios;
    bool verMas;
    String result;

    factory DesafiosResponse.fromJson(Map<String, dynamic> json) => DesafiosResponse(
        desafios: List<Desafio>.from(json["desafios"].map((x) => Desafio.fromJson(x))),
        verMas: json["verMas"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "desafios": List<dynamic>.from(desafios.map((x) => x.toJson())),
        "verMas": verMas,
        "result": result,
    };
}

