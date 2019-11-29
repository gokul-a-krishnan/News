import 'package:hive/hive.dart';

class DataManager {
  static final DataManager _instance = DataManager._internal();

  factory DataManager() {
    return _instance;
  }

  List userSearches = [];
  Box userSearchHive;
  List<String> defaultSearches;

  DataManager._internal() {
    defaultSearches = [
      "latest",
      "sports",
      "technology",
      "india",
    ];
    _initRecentBox();
  }
  _initRecentBox() async {
    userSearchHive = await Hive.openBox('recents');
    userSearchHive.values.forEach((f) {
      userSearches.add(f);
    });
  }

  addToRecent(String userSearch) {
    if (!userSearches.contains(userSearch)) {
      userSearchHive.add(userSearch);
      userSearches.add(userSearch);
    }
  }

  //Todo Hardcoded Recent Searches

  //Todo Hardcoded Default Searches

}
