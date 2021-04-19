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
