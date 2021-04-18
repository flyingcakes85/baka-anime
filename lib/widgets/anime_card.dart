import 'dart:convert';

import 'package:animeapidemo/anime_classes/anime_data.dart';
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
            arguments: snapshot.data.data.elementAt(index));
      },
      child: Container(
        height: 155,
        width: 300,
        // margin: EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.22), BlendMode.dstATop),
            image: NetworkImage(
                snapshot.data.data.elementAt(index).attributes.coverImage ==
                        null
                    ? "https://wallpapercave.com/wp/wp2887960.jpg"
                    : snapshot.data.data
                        .elementAt(index)
                        .attributes
                        .coverImage
                        .tiny
                        .toString()),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.network(snapshot.data.data
                    .elementAt(index)
                    .attributes
                    .posterImage
                    .small),
              ),
            ),
            Positioned(
              left: 115,
              top: 8,
              child: Container(
                width: 174,
                child: Text(
                  ((snapshot.data.data.elementAt(index).attributes.titles.en == null || snapshot.data.data.elementAt(index).attributes.titles.en == "")
                          ? null
                          : snapshot.data.data
                              .elementAt(index)
                              .attributes
                              .titles
                              .en) ??
                      ((snapshot.data.data.elementAt(index).attributes.titles.enUs == null ||
                              snapshot.data.data.elementAt(index).attributes.titles.enUs ==
                                  "")
                          ? null
                          : snapshot.data.data
                              .elementAt(index)
                              .attributes
                              .titles
                              .enUs) ??
                      ((snapshot.data.data.elementAt(index).attributes.titles.enJp == null ||
                              snapshot.data.data.elementAt(index).attributes.titles.enJp ==
                                  "")
                          ? null
                          : snapshot.data.data
                              .elementAt(index)
                              .attributes
                              .titles
                              .enJp) ??
                      (snapshot.data.data.elementAt(index).attributes.titles.jaJp != null
                          ? utf8.decode(latin1.encode(snapshot.data.data.elementAt(index).attributes.titles.jaJp),
                              allowMalformed: true)
                          : null) ??
                      (snapshot.data.data.elementAt(index).attributes.titles.koKr != null
                          ? utf8.decode(
                              latin1.encode(snapshot.data.data.elementAt(index).attributes.titles.koKr),
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
              top: 58,
              child: Row(
                children: [
                  Icon(Icons.star, size: 14),
                  SizedBox(width: 4),
                  Text(snapshot.data.data
                          .elementAt(index)
                          .attributes
                          .averageRating ??
                      " "),
                  SizedBox(width: 8),
                  Icon(Icons.person, size: 14),
                  SizedBox(width: 4),
                  Text(snapshot.data.data
                          .elementAt(index)
                          .attributes
                          .ageRating ??
                      " ")
                ],
              ),
            ),
            Positioned(
              left: 115,
              top: 72,
              child: Container(
                width: 174,
                child: Text(
                  snapshot.data.data.elementAt(index).attributes.synopsis ??
                      " ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Consts.trendCardDetails,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
