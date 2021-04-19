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

import 'package:get_storage/get_storage.dart';

class Watchlist {
  static List<String> getWatchlistIds() {
    final localData = GetStorage();
    int count = localData.read('count');
    List<String> l = [];
    if (count != 0) {
      final watchListString = localData.read('watchlist');
      l = watchListString.toString().split(';');
      print("gittn l");
      l.removeAt(0);
      print(l);
      return l;
    } else {
      return l;
    }
  }

  static bool watchlistContainsId(String id) {
    final localData = GetStorage();
    int count = localData.read('count');
    List<String> l;
    if (count != 0) {
      final watchListString = localData.read('watchlist');
      l = watchListString.toString().split(';');
      print("from watchldst contails");
      // print(l);

      if (l.contains(id))
        return true;
      else
        return false;
    } else {
      return false;
    }
  }

  static saveToWatchList(String id) {
    final localData = GetStorage();
    localData.write('count', (localData.read('count') ?? 0) + 1);

    List<String> l = [];
    print("thsi is data");
    print(l);
    final watchListString = localData.read('watchlist');
    l = watchListString.toString().split(';');

    if (!l.contains(id)) {
      l.add(id);
      localData.write('watchlist', l.join(";").toString());
    }
  }

  static removeFromWatchList(String id) {
    final localData = GetStorage();
    localData.write('count', (localData.read('count')) - 1);
    List<String> l;
    final watchListString = localData.read('watchlist');
    l = watchListString.toString().split(';');
    l.remove(id);
    localData.write('watchlist', l.join(";").toString());
  }
}
