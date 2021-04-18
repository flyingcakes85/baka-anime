import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/anime_classes/searchResult.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/widgets/anime_card.dart';

import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<AnimeSearchResult> animeSearchResult;
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
                    ? FutureBuilder<AnimeSearchResult>(
                        future: animeSearchResult,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print(snapshot.data.data.length);
                            return AnimeCard.animeCard(snapshot);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        },
                      )
                    : Text("Search Something"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
