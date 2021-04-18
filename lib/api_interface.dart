import 'package:animeapidemo/anime_classes/anime_details.dart';
import 'package:animeapidemo/anime_classes/anime_data.dart';
import 'package:http/http.dart' as http;

class ApiInterface {
  static Future<Anime> fetchAnimeDetails(String animeID) async {
    final response =
        await http.get(Uri.https('kitsu.io', '/api/edge/anime/' + animeID));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return animeFromMap(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Anime');
    }
  }

  static Future<AnimeData> fetchTrendingAnime() async {
    final response =
        await http.get(Uri.https('kitsu.io', '/api/edge/trending/anime'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return animeDataResultsFromMap(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Trending Anime');
    }
  }

  static Future<AnimeData> fetchSearchResults(String searchTerm) async {
    final response = await http.get(
        Uri.parse("https://kitsu.io/api/edge/anime?filter[text]=" + searchTerm),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return animeDataResultsFromMap(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load search results');
    }
  }
}
