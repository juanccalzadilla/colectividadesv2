import 'package:flutter/material.dart';

class Desafio {
  Desafio({
    required this.idDesafio,
    required this.img,
    required this.titulo,
    required this.subTitulo,
    required this.fecha,
    required this.texto,
    required this.enlace1,
    required this.enlace2,
    required this.enlace3,
    required this.enlace4,
    required this.enlace5,
    required this.enlace6,
  });

  int idDesafio;
  String img;
  String titulo;
  String subTitulo;
  DateTime fecha;
  String texto;
  String enlace1;
  String enlace2;
  String enlace3;
  String enlace4;
  String enlace5;
  String enlace6;

  List<Map<String, String>> adjuntos = [];

  void addAdjuntos() {
    if (enlace1 != '') {
      adjuntos.add({'enlace': enlace1, 'tipo': enlace1.split('.').last});
    }
    if (enlace2 != '') {
      adjuntos.add({'enlace': enlace2, 'tipo': enlace2.split('.').last});
    }
    if (enlace3 != '') {
      adjuntos.add({'enlace': enlace3, 'tipo': enlace3.split('.').last});
    }
    if (enlace4 != '') {
      adjuntos.add({'enlace': enlace4, 'tipo': enlace4.split('.').last});
    }
    if (enlace5 != '') {
      adjuntos.add({'enlace': enlace5, 'tipo': enlace5.split('.').last});
    }
    if (enlace6 != '') {
      adjuntos.add({'enlace': enlace6, 'tipo': enlace6.split('.').last});
    }
  }

  IconData getIcono(String? extension) {
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'jpg':
        return Icons.photo;
      case 'jpeg':
        return Icons.photo;
      case 'png':
        return Icons.photo;
      case 'gif':
        return Icons.video_collection_rounded;
      case 'mp4':
        return Icons.video_collection_rounded;
      case 'mp3':
        return Icons.video_collection_rounded;
      case 'wav':
        return Icons.video_collection_rounded;
      default:
        return Icons.web;
    }
  }

  get getAdjuntos => adjuntos;
  factory Desafio.fromJson(Map<String, dynamic> json) => Desafio(
        idDesafio: json["IdDesafio"],
        img: json["img"],
        titulo: json["titulo"],
        subTitulo: json["subTitulo"],
        fecha: DateTime.parse(json["fecha"]),
        texto: json["texto"],
        enlace1: json["enlace1"],
        enlace2: json["enlace2"],
        enlace3: json["enlace3"],
        enlace4: json["enlace4"],
        enlace5: json["enlace5"],
        enlace6: json["enlace6"],
      );

  Map<String, dynamic> toJson() => {
        "IdDesafio": idDesafio,
        "img": img,
        "titulo": titulo,
        "subTitulo": subTitulo,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "texto": texto,
        "enlace1": enlace1,
        "enlace2": enlace2,
        "enlace3": enlace3,
        "enlace4": enlace4,
        "enlace5": enlace5,
        "enlace6": enlace6,
      };
}
