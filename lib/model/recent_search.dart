import 'package:hive/hive.dart';
part 'recent_search.g.dart';

@HiveType()
class RecentSearch {
  @HiveField(0)
  final String userSearch;
  @HiveField(1)
  final int weight;

  RecentSearch(this.userSearch, this.weight);
}
