import 'package:flutter/material.dart';
class MePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MePageState();
  }
}
class MePageState extends State<MePage>{
  @override
  Widget build(BuildContext context) {
    print("渲染页面");
    // TODO: implement build
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Text("我的")
        ])
    );
  }
}