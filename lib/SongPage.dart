import 'package:flutter/material.dart';
class SongPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SongPageState();
  }
}
class SongPageState extends State<SongPage>{
  @override
  Widget build(BuildContext context) {
    print("渲染页面");
    // TODO: implement build
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Text("好歌声")
        ])
    );
  }
}