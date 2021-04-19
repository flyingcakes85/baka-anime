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
import 'package:animeapidemo/anime_classes/anime_details.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/widgets/heading_widget.dart';
import 'package:animeapidemo/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeDetailsPage extends StatefulWidget {
  @override
  _AnimeDetailsPageState createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {
  String animeId = Get.arguments;
  Future<Anime> anime;
  String title;
  String localizedTitle;
  final localStorage = GetStorage();
  void initState() {
    super.initState();
    anime = ApiInterface.fetchAnimeDetails(animeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.BACKGROUND_COLOR,
      body: FutureBuilder<Anime>(
          future: anime,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              title = snapshot.data.data.attributes.titles.en ??
                  snapshot.data.data.attributes.titles.enUs ??
                  snapshot.data.data.attributes.titles.enJp ??
                  " ";
              if (snapshot.data.data.attributes.titles.jaJp != null) {
                localizedTitle = utf8.decode(
                    latin1.encode(snapshot.data.data.attributes.titles.jaJp));
              } else if (snapshot.data.data.attributes.titles.koKr != null) {
                localizedTitle = utf8.decode(
                    latin1.encode(snapshot.data.data.attributes.titles.koKr));
              } else {
                localizedTitle = " ";
              }

              return Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Consts.BACKGROUND_COLOR,
                                  Colors.transparent
                                ],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.network(snapshot
                                .data.data.attributes.posterImage.large)),
                        Positioned(
                            left: 6,
                            top: 28,
                            child: CircleAvatar(
                              backgroundColor: Consts.BACKGROUND_COLOR,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            )),
                        Positioned(
                            right: 6,
                            top: 28,
                            child: CircleAvatar(
                              backgroundColor: Consts.BACKGROUND_COLOR,
                              child: IconButton(
                                icon: Icon(
                                  Watchlist.watchlistContainsId(
                                          snapshot.data.data.id)
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  bool isInWatchlist =
                                      Watchlist.watchlistContainsId(
                                          snapshot.data.data.id);
                                  if (isInWatchlist) {
                                    setState(() {
                                      print("removing");
                                      Watchlist.removeFromWatchList(
                                          snapshot.data.data.id);
                                    });
                                  } else {
                                    setState(() {
                                      print("adding");

                                      Watchlist.saveToWatchList(
                                          snapshot.data.data.id);
                                    });
                                  }
                                },
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                title,
                                style: GoogleFonts.raleway(fontSize: 32),
                              ),
                            ))
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      child: Text(
                        localizedTitle,
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(14),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Consts.shade,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: InfoTab(
                            data: snapshot.data.data.attributes.popularityRank
                                .toString(),
                            label: "POPULARITY RANK",
                          )),
                          Expanded(
                              child: InfoTab(
                            data: snapshot.data.data.attributes.ratingRank
                                .toString(),
                            label: "RATING RANK",
                          ))
                        ],
                      ),
                    ),
                    AnimePageHeadings(
                      leadingIcon: Icons.description_outlined,
                      label: "Synopsis",
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      child: Text(
                        snapshot.data.data.attributes.synopsis ?? " ",
                        style: Consts.animeDetailsText,
                      ),
                    ),
                    AnimePageHeadings(
                      leadingIcon: Icons.info_outline,
                      label: "Content Rating",
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Text(
                            snapshot.data.data.attributes.ageRating ?? " ",
                            style: Consts.animeDetailsEmph,
                          ),
                          SizedBox(width: 14),
                          Text(
                            snapshot.data.data.attributes.ageRatingGuide ?? " ",
                            style: Consts.animeDetailsText,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
            }
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class AnimePageHeadings extends StatelessWidget {
  const AnimePageHeadings({
    Key key,
    @required this.leadingIcon,
    @required this.label,
  }) : super(key: key);

  final IconData leadingIcon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 14),
        Heading(leadingIcon: leadingIcon, label: label),
      ],
    );
  }
}

class InfoTab extends StatelessWidget {
  const InfoTab({
    Key key,
    @required this.data,
    @required this.label,
  }) : super(key: key);

  final String data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.data ?? " ",
          style: Consts.animeDetailsEmph,
        ),
        SizedBox(height: 6),
        Text(
          this.label ?? " ",
          style: Consts.animeDetailsText,
        )
      ],
    );
  }
}
