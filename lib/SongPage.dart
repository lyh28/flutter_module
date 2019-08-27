import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    // TODO: implement build
    return Scaffold(
        body: Center(child: Text("好歌声"))
    );
  }
}