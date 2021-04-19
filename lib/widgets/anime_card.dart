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

import 'package:animeapidemo/anime_classes/anime_data.dart';
import 'package:animeapidemo/anime_classes/anime_details.dart';
import 'package:animeapidemo/anime_classes/anime_super.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/screens/animeDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeCard {
  static GestureDetector animeCard(
      AsyncSnapshot<AnimeData> snapshot, int index) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AnimeDetailsPage(),
            arguments: snapshot.data.data.elementAt(index).id);
      },
      child: animeCardBase(snapshot.data.data.elementAt(index).attributes),
    );
  }

  static GestureDetector animeCardWatchlist(String id) {
    if (id == "" || id == " " || id == null) {
      return GestureDetector(child: Container());
    } else {
      Future<Anime> anime = ApiInterface.fetchAnimeDetails(id);

      return GestureDetector(
        onTap: () {
          Get.to(() => AnimeDetailsPage(), arguments: id);
        },
        child: FutureBuilder<Anime>(
          future: anime,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return animeCardBase(snapshot.data.data.attributes);
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            }
            return CircularProgressIndicator();
          },
        ),
      );
    }
  }

  static Container animeCardBase(Attributes data) {
    return Container(
      height: 175,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.22), BlendMode.dstATop),
          image: NetworkImage(data.coverImage == null
              ? "https://wallpapercave.com/wp/wp2887960.jpg"
              : data.coverImage.tiny.toString()),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(data.posterImage.small),
            ),
          ),
          Positioned(
            left: 115,
            top: 8,
            child: Container(
              width: 174,
              child: Text(
                ((data.titles.en == null || data.titles.en == "")
                        ? null
                        : data.titles.en) ??
                    ((data.titles.enUs == null || data.titles.enUs == "")
                        ? null
                        : data.titles.enUs) ??
                    ((data.titles.enJp == null || data.titles.enJp == "")
                        ? null
                        : data.titles.enJp) ??
                    (data.titles.jaJp != null
                        ? utf8.decode(latin1.encode(data.titles.jaJp),
                            allowMalformed: true)
                        : null) ??
                    (data.titles.koKr != null
                        ? utf8.decode(latin1.encode(data.titles.koKr),
                            allowMalformed: true)
                        : null) ??
                    "unknown",
                overflow: TextOverflow.fade,
                maxLines: 2,
                style: Consts.trendCardHeading,
              ),
            ),
          ),
          Positioned(
            left: 115,
            top: 68,
            child: Row(
              children: [
                Icon(Icons.star, size: 14),
                SizedBox(width: 4),
                Text(data.averageRating ?? " "),
                SizedBox(width: 8),
                Icon(Icons.person, size: 14),
                SizedBox(width: 4),
                Text(data.ageRating ?? " ")
              ],
            ),
          ),
          Positioned(
            left: 115,
            top: 82,
            child: Container(
              width: 174,
              child: Text(
                data.synopsis ?? "No Synopsis",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: Consts.trendCardDetails,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
