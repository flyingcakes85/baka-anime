import 'package:animeapidemo/anime_classes/anime_data.dart';
import 'package:animeapidemo/screens/about.dart';
import 'package:animeapidemo/screens/search_page.dart';
import 'package:animeapidemo/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';
import 'package:animeapidemo/api_interface.dart';
import 'package:animeapidemo/widgets/anime_card.dart';
import 'package:animeapidemo/widgets/heading_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
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
  final localData = GetStorage();

  int count;
  List<String> watchlist = [];
  // List<Future<Anime>> watchlistAnime = [];
  @override
  void initState() {
    super.initState();
    futureAnime = ApiInterface.fetchTrendingAnime();
    count = localData.read('count') ?? 0;
    if (count > 0) watchlist = Watchlist.getWatchlistIds();
    print(watchlist);
    localData.listen(() {
      setState(() {
        count = localData.read('count');
        watchlist = Watchlist.getWatchlistIds();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(color: Consts.APP_BAR_COLOR),
        child: Text(
          "This drawer is the only non funtional component here",
          textAlign: TextAlign.center,
          style: Consts.animeDetailsText,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Get.to(() => AboutPage());
              })
        ],
        title: Center(
          child: Text(
            Consts.APP_TITLE,
            style: Consts.appTitleTextStyle,
          ),
        ),
        backgroundColor: Consts.APP_BAR_COLOR,
      ),
      backgroundColor: Consts.BACKGROUND_COLOR,
      body: Container(
        margin: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Heading(leadingIcon: Icons.trending_up, label: Consts.TRENDING),
              SizedBox(height: 18),
              Container(
                child: FutureBuilder<AnimeData>(
                  future: futureAnime,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          height: 175,
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
              SizedBox(height: 18),
              Heading(
                  leadingIcon: Icons.live_tv_outlined,
                  label: Consts.YOUR_WATCHLIST),
              SizedBox(height: 28),
              (count == 0)
                  ? Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 46),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.tv_off, color: Consts.shade),
                                SizedBox(width: 12),
                                Text(
                                  Consts.EMPTY_WATCHLIST,
                                  style: Consts.animeDetailsText,
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text(
                              Consts.EMPTY_WATCHLIST_HINT,
                              textAlign: TextAlign.center,
                              style: Consts.animeDetailsText,
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                    )
                  : ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 12);
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: watchlist.length,
                      itemBuilder: (context, index) {
                        return AnimeCard.animeCardWatchlist(
                            watchlist.elementAt(index));
                      }),
              Container(height: 62),
            ],
          ),
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
