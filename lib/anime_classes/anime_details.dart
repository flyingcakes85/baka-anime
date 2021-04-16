import 'dart:convert';
import 'package:animeapidemo/anime_classes/anime_super.dart';

Anime animeFromMap(String str) => Anime.fromMap(json.decode(str));

String animeToMap(Anime data) => json.encode(data.toMap());

class Anime {
  Anime({
    this.data,
  });

  Data data;

  factory Anime.fromMap(Map<String, dynamic> json) => Anime(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data.toMap(),
      };
}
