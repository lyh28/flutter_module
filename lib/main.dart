import 'package:flutter/material.dart';
import 'package:flutter_module/HomePage/HomePage.dart';
import 'ActionPage.dart';
import 'MePage.dart';
import 'SongPage.dart';
import 'package:flutter_module/Video/Mp4Video.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'dart:ui' as ui;
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
  MethodChannel methodChannel;
  String route;
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    FlutterBoost.singleton.registerPageBuilders({
//      'KuGou://homePage': (pageName, params, _) => HomePage(),
//      'KuGou://actionPage': (pageName, params, _) => ActionPage(),
//      'KuGou://mePage': (pageName, params, _) => MePage(),
//      'KuGou://songPage': (pageName, params, _) => SongPage(),
//      'KuGou://videoPage': (pageName, params, _) => Mp4Video(),
//    });
//    FlutterBoost.handleOnStartPage();
    route=ui.window.defaultRouteName;
    methodChannel=MethodChannel("com.lyh/flutter");
    methodChannel.setMethodCallHandler(handler);
  }

  Future<dynamic> handler(MethodCall call){
    print("方法被调用");
    switch(call.method){
      case "TabRoute":
//          FlutterBoost.singleton.openPage("KuGou://homePage", {});
      setState(() {
        route=call.arguments;
      });
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    print("主页面");
    return MaterialApp(
//      routes: {"home": (BuildContext)=> HomePage()},
      title: 'Flutter Demo',
//      builder: FlutterBoost.init(),
//      home: Container(),
        home: _widgetForRoute(route)
    );
  }

  Widget _widgetForRoute(String routes) {
    print("选择路由");
    switch (routes) {
      case 'HomePage':
        return HomePage();
      case 'ActionPage':
        return ActionPage();
      case 'MePage':
        return MePage();
      case 'SongPage':
        return SongPage();
      case 'VideoPage':
        return Mp4Video();
      default:
        return Scaffold();
    }
  }
}
