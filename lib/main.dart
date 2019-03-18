import 'package:flutter/material.dart';
import 'components/buttonGroup.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 230.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
      // decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Image.asset("images/true.jpg")
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

class InfoHeader extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return new Container(
        padding:const EdgeInsets.all(32.0),
        child:Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                children: <Widget>[
                  new Text(
                    '省应急厅领导批示文件省(省应急厅值班员上报)',
                    style:new TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  new Text(
                    '2019-03-14 09:21',
                    style:new TextStyle(
                      color: Colors.grey[500],
                    )
                  )
                ],
              ),
            ),
            new FavoriteWidget(),
          ],
        )
      );
    }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material( 
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(),
          new InfoHeader(),
          new ButtonGroup(),
          new Container(
            padding:const EdgeInsets.all(32.0),
            child:new Text(
              "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
              softWrap: true,
            )
          )
        ],
      ),
    );
  }
}


void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
    theme:new ThemeData(
      brightness:Brightness.light,
      primaryColor: Colors.grey,
      accentColor: Colors.cyan[600],
    )
  ));
}