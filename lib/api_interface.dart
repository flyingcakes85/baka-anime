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

import 'package:animeapidemo/anime_classes/anime_details.dart';
import 'package:animeapidemo/anime_classes/anime_data.dart';
import 'package:http/http.dart' as http;

class ApiInterface {
  static Future<Anime> fetchAnimeDetails(String animeID) async {
    print("anime id " + animeID);
    final response =
        await http.get(Uri.https('kitsu.io', '/api/edge/anime/' + animeID));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return animeFromMap(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.body);
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
