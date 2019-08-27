import 'package:flutter/material.dart';
import 'package:flutter_module/HomePage/HomePage.dart';
import 'ActionPage.dart';
import 'MePage.dart';
import 'SongPage.dart';
import 'package:flutter_module/Video/Mp4Video.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/services.dart';
void main() {
  print("启动flutter");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBoost.singleton.registerPageBuilders({
      'KuGou://MainPage': (pageName, params, _) => MainPage(),
      'KuGou://videoPage': (pageName, params, _) => Mp4Video(),
    });
    FlutterBoost.handleOnStartPage();

  }

  @override
  Widget build(BuildContext context) {
    print("主页面");
    return MaterialApp(
      title: 'Flutter Demo',
      builder: FlutterBoost.init(),
      home: Container(),
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}
class MainPageState extends State<MainPage>{
  MethodChannel _methodChannel;
  Widget child;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    child=HomePage();
    _methodChannel=MethodChannel("flutter.io/route");
    _methodChannel.setMethodCallHandler(methodCallHandler);
  }
  Future<dynamic> methodCallHandler(MethodCall methodCall){
    switch(methodCall.method){
      case "ToSong":
        print("调用方法");
        child=SongPage();
        break;
      case "ToHome":
        child=HomePage();
        break;
      case "ToMe":
        child=MePage();
        break;
      case "ToAction":
        child=ActionPage();
        break;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return child;
  }
}
