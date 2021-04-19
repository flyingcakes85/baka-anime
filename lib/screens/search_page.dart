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

import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/anime_classes/anime_data.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/widgets/anime_card.dart';

import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<AnimeData> animeSearchResult;
  bool isSearching;

  void initState() {
    super.initState();
    isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.BACKGROUND_COLOR,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 4),
                TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  autocorrect: false,
                  cursorColor: Consts.APP_ACCENT,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                      labelText: "SEARCH"),
                  onSubmitted: (value) {
                    if (value.length < 3) {
                      Get.snackbar(
                        "Query Too Small", // title
                        "Please enter at least three characters", // message
                        icon: Icon(Icons.warning_amber_outlined),
                        snackPosition: SnackPosition.BOTTOM,
                        shouldIconPulse: true,
                        barBlur: 7,
                        isDismissible: true,
                        duration: Duration(seconds: 3),
                      );
                    } else {
                      setState(() {
                        animeSearchResult =
                            ApiInterface.fetchSearchResults(value);
                        isSearching = true;
                      });
                    }
                  },
                ),
                SizedBox(height: 12),
                isSearching
                    ? FutureBuilder<AnimeData>(
                        future: animeSearchResult,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(height: 12);
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.data.length,
                                itemBuilder: (context, index) {
                                  return AnimeCard.animeCard(snapshot, index);
                                });
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
