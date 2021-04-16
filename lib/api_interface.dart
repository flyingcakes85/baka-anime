import 'package:animeapidemo/anime_classes/trending_anime.dart';
import 'package:http/http.dart' as http;

class ApiInterface {
  static Future<TrendingAnime> fetchAnimeDetails(String animeID) async {
    final response =
        await http.get(Uri.https('kitsu.io', '/api/edge/anime/' + animeID));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return trendingAnimeFromMap(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Anime');
    }
  }

  static Future<TrendingAnime> fetchTrendingAnime() async {
    final response =
        await http.get(Uri.https('kitsu.io', '/api/edge/trending/anime'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return trendingAnimeFromMap(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Trending Anime');
    }
  }
}
