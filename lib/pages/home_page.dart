import 'package:flutter/material.dart';
import 'package:study_monk/widgets/notice_list.dart';
import '../widgets/data_search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          )
        ],
      ),
      // backgroundColor: Colors.greenAccent,
      body: NoticeList(
        news: 'flutter',
      ),
    );
  }
}
