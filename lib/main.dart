import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/anime.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAKA CLUB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      themeMode: ThemeMode.dark,
      home: MyHomePage(title: Consts.APP_TITLE),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Anime> futureAnime;
  @override
  void initState() {
    super.initState();
    futureAnime = fetchAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        child: Container(),
      ),
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
        title: Center(
          child: Text(
            "BAKA CLUB",
            style: Consts.appTitleTextStyle,
          ),
        ),
        backgroundColor: Consts.APP_BAR_COLOR,
      ),
      backgroundColor: Color(0xff121212),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(18),
            child: Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: Colors.red.shade300,
                ),
                SizedBox(width: 8),
                Text(
                  "Trending",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poiretOne(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          FutureBuilder<Anime>(
            future: futureAnime,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: 155,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 2);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 155,
                        width: 300,
                        margin: EdgeInsets.only(left: 14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.22),
                                    BlendMode.dstATop),
                                image: NetworkImage(snapshot.data.data
                                    .elementAt(index)
                                    .attributes
                                    .coverImage
                                    .tiny
                                    .toString()))),
                        child: Stack(
                          children: [
                            Positioned(
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Image.network(snapshot.data.data
                                        .elementAt(index)
                                        .attributes
                                        .posterImage
                                        .small))),
                            Positioned(
                                left: 115,
                                top: 8,
                                child: Container(
                                  width: 174,
                                  child: Text(
                                    snapshot.data.data
                                        .elementAt(index)
                                        .attributes
                                        .titles
                                        .en,
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                    style: GoogleFonts.oxygen(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
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
                                        .averageRating),
                                    SizedBox(width: 8),
                                    Icon(Icons.person, size: 14),
                                    SizedBox(width: 4),
                                    Text(snapshot.data.data
                                        .elementAt(index)
                                        .attributes
                                        .ageRating)
                                  ],
                                )),
                            Positioned(
                                left: 115,
                                top: 72,
                                child: Container(
                                  width: 174,
                                  child: Text(
                                    snapshot.data.data
                                        .elementAt(index)
                                        .attributes
                                        .synopsis,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: Consts.detailsTextStyle,
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade300,
        onPressed: () {},
        tooltip: 'SEARCH',
        child: Icon(Icons.search),
      ),
    );
  }
}
