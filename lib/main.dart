import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/anime.dart';
import 'package:animeapidemo/widgets/trendingCard.dart';

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
        accentColor: Colors.red,
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
    futureAnime = ApiInterface.fetchAnime();
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
                  style: Consts.categoryHeading,
                ),
              ],
            ),
          ),
          FutureBuilder<Anime>(
            future: futureAnime,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return TrendingCard.trendingCard(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.red.shade200,
              ));
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
