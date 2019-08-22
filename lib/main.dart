import 'package:flutter/material.dart';
import 'package:flutter_module/HomePage/HomePage.dart';
import 'ActionPage.dart';
import 'MePage.dart';
import 'SongPage.dart';
import 'package:flutter_module/Video/Mp4Video.dart';
import 'package:flutter_boost/flutter_boost.dart';
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
      'KuGou://homePage': (pageName, params, _) => HomePage(),
      'KuGou://actionPage': (pageName, params, _) => ActionPage(),
      'KuGou://mePage': (pageName, params, _) => MePage(),
      'KuGou://songPage': (pageName, params, _) => SongPage(),
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
