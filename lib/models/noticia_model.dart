class Noticia {
    Noticia({
        required this.idNoticia,
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
        required this.fechaPublicacion,
        required this.oculta,
        required this.impresiones,
    });

    int idNoticia;
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
    String fechaPublicacion;
    int oculta;
    int impresiones;

    factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        idNoticia: json["IdNoticia"],
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
        fechaPublicacion: json["fechaPublicacion"],
        oculta: json["oculta"],
        impresiones: json["impresiones"],
    );

    Map<String, dynamic> toJson() => {
        "IdNoticia": idNoticia,
        "img": img,
        "titulo": titulo,
        "subTitulo": subTitulo,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "texto": texto,
        "enlace1": enlace1,
        "enlace2": enlace2,
        "enlace3": enlace3,
        "enlace4": enlace4,
        "enlace5": enlace5,
        "enlace6": enlace6,
        "fechaPublicacion": fechaPublicacion,
        "oculta": oculta,
        "impresiones": impresiones,
    };
}