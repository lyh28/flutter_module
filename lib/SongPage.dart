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
  void initState() {
    // TODO: implement initState
    EventChannel eventChannel=EventChannel("");
    eventChannel.receiveBroadcastStream().listen((e){

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Text("好歌声")
        ])
    );
  }
}