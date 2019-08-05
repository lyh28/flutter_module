import 'package:flutter/material.dart';
class ActionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ActionPageState();
  }
}
class ActionPageState extends State<ActionPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("dispose");
  }
  @override
  Widget build(BuildContext context) {
    print("渲染页面");
    // TODO: implement build
    return Scaffold(
        body : Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Text("动态")
        ])
    );
  }


}