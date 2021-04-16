import 'dart:convert';
import 'package:animeapidemo/anime_classes/anime_super.dart';

TrendingAnime trendingAnimeFromMap(String str) =>
    TrendingAnime.fromMap(json.decode(str));

String trendingAnimeToMap(TrendingAnime data) => json.encode(data.toMap());

class TrendingAnime {
  TrendingAnime({
    this.data,
  });

  List<Datum> data;

  factory TrendingAnime.fromMap(Map<String, dynamic> json) => TrendingAnime(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
