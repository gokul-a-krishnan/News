import 'package:flutter/material.dart';
import 'package:study_monk/widgets/notice_list.dart';
import '../data/data_manager.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODOimplement buildActions
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODOimplement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODOimplement buildResults
    // print('GK Log: '+query);
    DataManager().addToRecent(query);
    return NoticeList(
      news:query
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODOShow Suggestions
    var suggestionList;
    if (query.isEmpty)
      suggestionList = DataManager().defaultSearches;
    else {
      try {
        suggestionList =
            DataManager().userSearches.where((p) => p.startsWith(query)).toList();
      } catch (e) {
          suggestionList = [query];
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.call_made),
              onPressed: () {
                query = suggestionList[index];
              },
            )
          ],
        ),
        onTap: () {
          showResults(context);
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
