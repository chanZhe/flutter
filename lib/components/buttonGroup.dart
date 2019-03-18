import 'package:flutter/material.dart';

class ButtonGroup extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Column buildButtonColumn(IconData icon,String label){
      Color color = Colors.blue[600];
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
              margin:const EdgeInsets.only(top:8.0),
              child: new Text(
                label,
                style:new TextStyle(
                  fontSize:12.0,
                  fontWeight:FontWeight.w400,
                  color:color
                )
              ),
            ),
        ],
      );
    }
    

    return new Container(
      child:new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            buildButtonColumn(Icons.call, '电话'),
            buildButtonColumn(Icons.message, '传真'),
            buildButtonColumn(Icons.update, '上报'),
        ],)
    );
  }
}
