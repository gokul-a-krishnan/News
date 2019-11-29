import 'package:flutter/material.dart';
import 'package:study_monk/api/news_api.dart';

import 'notice.dart';

class NoticeList extends StatefulWidget {
  final news;
  NoticeList({@required this.news});
  final state = new _NoticeListState();
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  //top bar
  List _categories = new List();
  int _categorySelected = 0;

  //news is initialised as LIST
  List _news = new List();
  var repository = new NewsApi();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          // _getListCategory(), //! temparorily disabled
          new Expanded(
            //here we are asking for list of news
            child: _getListViewWidget(),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadNotices();
    setCategories();
  }

  //now here we are building list
  _getListViewWidget() {
    var list = new ListView.builder(
      itemCount: _news.length,
      padding: new EdgeInsets.only(top: 5.0),
      itemBuilder: (BuildContext context, int index) {
        return _news[index];
      },
    );
    return list;
  }

  loadNotices() async {
    List result = await repository.loadNews(widget.news);

    setState(() {
      for (var item in result) {
        var notice = new Notice(item['urlToImg'], item['title'],
            item['publishedAt'], item['description']);
        //populating news
        _news.add(notice);
      }
    });
  }

  //top categories
  void setCategories() {
    _categories.add('General');
    _categories.add('Sport');
    _categories.add('Technology');
    _categories.add('Entertainment');
    _categories.add('Health');
    _categories.add('Buisness');
  }

  _getListCategory() {
    ListView listCategory = new ListView.builder(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildCategoryItem(index);
        });

    return new Container(
      height: 55.0,
      child: listCategory,
    );
  }

  _buildCategoryItem(index) {
    return new GestureDetector(
        onTap: () {
          onTabCategory(index);
        },
        child: new Center(
          child: new Container(
            margin: EdgeInsets.only(left: 10.0),
            child: new Material(
              elevation: 10.0,
              borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
              child: new Container(
                padding: new EdgeInsets.only(
                    left: 12.0, top: 7.0, bottom: 7.0, right: 12.0),
                color: _categorySelected == index
                    ? Colors.blue[800]
                    : Colors.blue[500],
                child: new Text(
                  _categories[index],
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ));
  }

  onTabCategory(index) {
    setState(() {
      _categorySelected = index;
    });
  }
}
