import 'package:flutter_module/HomePage/HomePagePush.dart';
import 'package:flutter_module/HomePage/HomePageSinger.dart';

import 'package:flutter/material.dart';
//主页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body : Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          TitlePage(),
          Expanded(
            child: ChooseType(),
          )
        ])
    );
  }
}

//标题栏
class TitlePage extends StatelessWidget {
  TitlePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 32.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.grade),
                ),
                Expanded(flex: 2, child: SearchView()),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.access_time),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.favorite_border),
                )
              ]),
        ));
  }
}

//搜索栏
class SearchView extends StatelessWidget {
  SearchView({hint = "搜索"}) {
    this.hint = hint;
  }

  String hint;
  String content;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SizedBox(
      //Color.fromARGB(250,248, 248, 248)
        height: 32,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(250, 230, 230, 230)),
          child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("输入房间号、昵称和歌曲名",
                        style: TextStyle(color: Colors.grey)),
                  )
                ],
              )),
        ));
  }
}

//选择 Layout
class ChooseType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChooseTypeState();
}

//选择栏
class _ChooseTypeState extends State<ChooseType>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tablist = ["关注", "推荐", "附近", "歌手", "颜值", "新秀", "特色"];
  var tabs = <Widget>[
    Tab(text: "关注"),
    HomePagePush(),
    Tab(text: "附近"),
    HomePageSinger(),
    Tab(text: "颜值"),
    Tab(text: "新秀"),
    Tab(text: "特色"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tablist.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Container(
        height: 40,
        child: TabBar(
            labelPadding: EdgeInsets.all(10),
            indicatorPadding: EdgeInsets.only(bottom: 7),
            controller: _tabController,
            isScrollable: false,
            labelStyle: TextStyle(fontSize: 14.0),
            unselectedLabelStyle: TextStyle(fontSize: 11.0),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.greenAccent,
            labelColor: Colors.black,
            tabs: tablist
                .map((e) => Text(
              e,
            ))
                .toList()),
      ),
      Container(height: 0.1, color: Colors.grey, child: Row()),
      Expanded(
          child: TabBarView(
            controller: _tabController,
            children: tabs,
          ))
    ]);
  }
}