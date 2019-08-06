import 'package:flutter/material.dart';
import '../Bean/PersonBean.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
class PushIndex extends StatefulWidget {
  PushIndex(@required this.personBean, {Key key}) : super(key: key);
  PersonBean personBean;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonItemState();
  }
}

class PersonItemState extends State<PushIndex>{
  static MethodChannel methodChannel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(methodChannel==null)
      methodChannel=new MethodChannel("com.lyh/flutter");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(onTap: (){
      FlutterBoost.singleton.openPage("KuGou://videoPage", {});
    },child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.topLeft,
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "images/default.jpg",
                  image: widget.personBean.image,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                        color:
                        widget.personBean.tag == null ? null : widget.personBean.tag.color),
                    child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                            widget.personBean.tag == null ? "" : widget.personBean.tag.tagName,
                            style: TextStyle(color: Colors.white, fontSize: 10))),
                  ),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Text(widget.personBean.label,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800))),
        Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(widget.personBean.nickName, style: TextStyle(fontSize: 10))),
      ],
    ),);
  }
}