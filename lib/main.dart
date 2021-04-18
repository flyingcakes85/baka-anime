import 'package:animeapidemo/anime_classes/anime_data.dart';
import 'package:animeapidemo/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/widgets/anime_card.dart';
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
  Future<AnimeData> futureAnime;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(18),
                child:
                    Heading(leadingIcon: Icons.trending_up, label: "Trending")),
            Container(
              padding: EdgeInsets.only(left: 12),
              child: FutureBuilder<AnimeData>(
                future: futureAnime,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return TrendingCard.trendingCard(snapshot);
                    return Container(
                        height: 155,
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(width: 12);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              return AnimeCard.animeCard(snapshot, index);
                            }));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.all(18),
                child: Heading(
                    leadingIcon: Icons.live_tv_outlined,
                    label: "Your Watchlist")),
            Container(
              height: 300,
              child: Center(
                child: Text("To be implemented"),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Consts.shade,
        onPressed: () {
          Get.to(() => SearchPage());
        },
        tooltip: 'SEARCH',
        child: Icon(Icons.search),
      ),
    );
  }
}
