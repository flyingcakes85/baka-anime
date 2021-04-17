import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/anime_classes/trending_anime.dart';
import 'package:animeapidemo/widgets/trendingCard.dart';
import 'package:animeapidemo/widgets/heading_widget.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
  Future<TrendingAnime> futureAnime;
  @override
  void initState() {
    super.initState();
    futureAnime = ApiInterface.fetchTrendingAnime();
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
            Consts.APP_TITLE,
            style: Consts.appTitleTextStyle,
          ),
        ),
        backgroundColor: Consts.APP_BAR_COLOR,
      ),
      backgroundColor: Consts.BACKGROUND_COLOR,
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(18),
              child:
                  Heading(leadingIcon: Icons.trending_up, label: "Trending")),
          FutureBuilder<TrendingAnime>(
            future: futureAnime,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return TrendingCard.trendingCard(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Consts.shade,
        onPressed: () {},
        tooltip: 'SEARCH',
        child: Icon(Icons.search),
      ),
    );
  }
}
