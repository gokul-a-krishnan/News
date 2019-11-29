import 'package:flutter/material.dart';
import 'details.dart';

//this class defines a container that has news headline, img, description,date... we fetch this class into 
//the listView builder NoticeList.dart to arrange the data..


class Notice extends StatefulWidget {

  final img;
  final _title;
  final _date;
  final _description;
   
   //all this data will be sent by api from noticelist.dart
   Notice(this.img,this._title,this._date,this._description);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
   BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Container(
      margin :  const  EdgeInsets . only (left :  10.0 , right :  10.0 , bottom :  10.0 , top :  0.0 ),
      child: Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: new InkWell(
          onTap: showDetail,
          splashColor: Colors.blue,
          child: _getListTile(),
        )
      )
      
    );
  }

  _getListTile() {
    return  new  Container (
      height :  95.0 ,
      child :  new  Row (
        crossAxisAlignment :  CrossAxisAlignment .start,
        children :  < Widget > [
           new Hero(
            tag: widget._title, child: _getImgWidget((widget.img)),
          ),
         
          _getColumText(widget._title, widget._date, widget._description),
      ],

    ),
    );
  }

  _getColumText(title,date,description){
     return  new  Expanded (
        child :  new  Container (
          margin :  new  EdgeInsets . all ( 10.0 ),
          child :  new  Column (
            crossAxisAlignment : CrossAxisAlignment .start,
            children :  < Widget > [
              _getTitleWidget(widget._title),
              _getDateWidget(widget._date),
              _getDescriptionWidget(widget._description)],
          ),
        )
    );

  }

  Widget _getImgWidget(String url){

    return new Container(
      width: 95.0,
      height: 95.0,
      child: new ClipRRect(
        borderRadius: new BorderRadius.only(topLeft: const Radius.circular(6.0),bottomLeft: const Radius.circular(6.0)),
        child: _getImageNetwork(url),
      ),
    );
  }

  Widget _getImageNetwork(String url){

    try{
      if(url.isNotEmpty) {

        return new FadeInImage.assetNetwork(
          placeholder: 'assets/place_holder.jpg',
          image: url,
          fit: BoxFit.cover,);

      }else{
        return new Image.asset('assets/place_holder.jpg');
      }

    }catch(e){
      return new Image.asset('assets/place_holder.jpg');
    }

  }

  _getTitleWidget(String title){
    return new Text(title, maxLines: 1, style: new TextStyle(fontWeight: FontWeight.bold));
  }

  _getDescriptionWidget(String description){
    return  new  Container (
      margin :  new  EdgeInsets . only (top :  5.0 ),
      child :  new  Text (description, maxLines :  2 ,),
    );

  }

  _getDateWidget(String date){
     return  new  Text (date,
      style :  new  TextStyle (color :  Colors .grey, fontSize :  10.0 ),);
  }

  showDetail () {
    Navigator
    . of (_context)
    . push ( new  MaterialPageRoute (builder : ( BuildContext context) {
      return  new  Detail (widget.img,widget._title, widget._date, widget._description);
    }));
  }
}
  

