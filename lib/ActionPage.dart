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
  Widget build(BuildContext context) {
    print("渲染页面");
    // TODO: implement build
    return Scaffold(
        body: Center(child: Text("动态"))
    );
  }


}