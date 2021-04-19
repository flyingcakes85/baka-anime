// Baka Anime - A Simple Demonstration App for Kitsu API (unofficial)
// Copyright (C) 2021  Snehit Sah

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
