import 'dart:async';
import '../Bean/PersonBean.dart';
import '../Requset/KuGouRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_module/Widget/PersonItem.dart';
//歌手页
class HomePageSinger extends StatefulWidget {
  HomePageSinger({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageSingerState();
  }
}

class HomePageSingerState extends State<HomePageSinger> {
  List<Widget> baseWidgetLilst = List();

  void init() {
    Beans.initPerson().then((e) {
      if (!Beans.checkNull()) setState(() {});
    });
    Beans.personindex = 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> onRefresh() async {
    setState(() {
      print("开始刷新");
      init();
    });
  }

  Future<void> loadMore() async {
    print("加载更多");
    Beans.loadMore().then((e) {
      setState(() {});
      print("加载更多完成");
    });
  }

  @override
  void dispose() {
    // TODO: implement deactivate
    super.dispose();
    //清理缓存
    Beans.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    if (Beans.checkNull()) {
      return Container();
    }
    print("渲染页面");
    baseWidgetLilst.clear();
    baseWidgetLilst.add(PushMore());

    // TODO: implement build
    return EasyRefresh(
        onRefresh: onRefresh,
        loadMore: loadMore,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: baseWidgetLilst)));
  }
}

//一行两个  格式
class PushMore extends StatelessWidget {
  static List<Widget> moreList = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //每次两个地添加
    while ((Beans.personindex + 2) <= Beans.personBeanList.length) {
      moreList.add(PushIndex(Beans.personBeanList[Beans.personindex]));
      moreList.add(PushIndex(Beans.personBeanList[Beans.personindex + 1]));
      Beans.personindex += 2;
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.88,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: moreList.length,
          itemBuilder: (context, index) {
            return moreList[index];
          }),
    );
  }
}

//存储类对象
class Beans {
  static List<PersonBean> personBeanList;

  static int personindex = 0;

  static void clearCache() {
    personindex = 0;
    personBeanList = null;
    print("清理 $personBeanList ");
  }
  static Future initPerson() async {
    print("请求initPerson");
    Map map = await KuGouRequest.getJsonData(KuGouRequest.PERSON_URL);
    personBeanList = PersonBean.getListFromJSON(map);
  }

  static Future loadMore() async {
    Map map = await KuGouRequest.getJsonData(KuGouRequest.PERSON_URL);
    personBeanList.addAll(PersonBean.getListFromJSON(map));
  }

  static bool checkNull() {
    return personBeanList == null ;
  }
}
