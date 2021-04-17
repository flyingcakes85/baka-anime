import 'package:animeapidemo/anime_classes/anime_super.dart';
import 'package:animeapidemo/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeDetailsPage extends StatefulWidget {
  @override
  _AnimeDetailsPageState createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {
  Datum anime = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.BACKGROUND_COLOR,
      body: Container(
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
                        colors: [Consts.BACKGROUND_COLOR, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(anime.attributes.posterImage.large)),
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
                        icon: Icon(Icons.star),
                        onPressed: () {},
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        anime.attributes.titles.en,
                        style: GoogleFonts.raleway(fontSize: 32),
                      ),
                    ))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              child: Text(
                anime.attributes.titles.jaJp,
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
                    data: anime.attributes.popularityRank.toString(),
                    label: "POPULARITY RANK",
                  )),
                  Expanded(
                      child: InfoTab(
                    data: anime.attributes.ratingRank.toString(),
                    label: "RATING RANK",
                  ))
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 14),
                Icon(
                  Icons.description_outlined,
                  color: Consts.shade,
                ),
                SizedBox(width: 8),
                Text(
                  "Synopsis",
                  textAlign: TextAlign.left,
                  style: Consts.categoryHeading,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              child: Text(
                anime.attributes.synopsis,
                style: Consts.animeDetailsText,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 14),
                Icon(
                  Icons.info_outline,
                  color: Consts.shade,
                ),
                SizedBox(width: 8),
                Text(
                  "Content Rating",
                  textAlign: TextAlign.left,
                  style: Consts.categoryHeading,
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(
                    anime.attributes.ageRating,
                    style: Consts.animeDetailsEmph,
                  ),
                  SizedBox(width: 14),
                  Text(
                    anime.attributes.ageRatingGuide,
                    style: Consts.animeDetailsText,
                  )
                ],
              ),
            )
          ],
        ),
      )),
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
          this.data,
          style: Consts.animeDetailsEmph,
        ),
        SizedBox(height: 6),
        Text(
          this.label,
          style: Consts.animeDetailsText,
        )
      ],
    );
  }
}
