import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_module/Widget/DefaultIJKPlayerWrapper.dart';
class Mp4Video extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Mp4VideoState();
  }
}
class Mp4VideoState extends State<Mp4Video> {
  PageController _pageController;
  IjkMediaController _ijkMediaController;
  int offset = 0;
  static final steam1 = "rtmp://183.57.150.180:1935/live/fx_hifi_1357324297_sub?token\u003d920ddb6334a79df3f5d1014eeabb93e9\u0026us\u003d1501304837\u0026tp\u003d1566268111000859\u0026ti\u003d30\u0026kd\u003d57\u0026ua\u003dfx-alone-android\u0026cn\u003dfx\u0026cp\u003d2763559799\u0026lr\u003d0\u0026fx-ps\u003d2-1501304837-1566268111863";
  static final steam2 ="rtmp://183.57.150.180:1935/live/fx_hifi_1468280258_low?token\u003dd6931339a80fcf5ab13f6bfbc3d21e0a\u0026us\u003d1501304837\u0026tp\u003d1566268419000963\u0026ti\u003d30\u0026kd\u003d57\u0026ua\u003dfx-alone-android\u0026cn\u003dfx\u0026cp\u003d2763559799\u0026lr\u003d0\u0026fx-ps\u003d2-1501304837-1566268419964";
  static final steam3 ="rtmp://58.200.131.2:1935/livetv/hunantv";
  static final steam4="rtmp://183.57.150.180:1935/live/fx_hifi_1520785452_sub?token=75bdeb56bd613b38dbf150a57863335c&us=1501304837&tp=1566179095000027&ti=30&kd=57&ua=fx-alone-android&cn=fx&cp=2763559799&lr=0&fx-ps=2-1501304837-1566179095037";
  static final steam5="rtmp://183.57.150.180:1935/live/fx_hifi_1481435640?token=a2ad4350a92788c52e3bf0a8199b33bd&us=1501304837&tp=1566183593000981&ti=30&kd=57&ua=fx-alone-android&cn=fx&cp=2763559799&lr=0&fx-ps=2-1501304837-1566183593987";

  List strs=[steam1,steam4,steam2,steam3,steam5];
  Widget image;
  bool isPlay=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSteam();
    //PageView设置
    initPageView();
  }
  //设置直播
  void initSteam() async{
    _ijkMediaController = IjkMediaController();
    _ijkMediaController.playingStream.listen(playingListener);
    await _ijkMediaController.setNetworkDataSource(strs[0],autoPlay: true);
  }

  //是否播放的监听
  void playingListener(bool data){
    if(data==null)  return ;
    print("是否播放中   $data");
    if(data){
      isPlay=true;
      Timer(Duration(seconds: 1),callback);
    }
    else  {
      isPlay = false;
      setState(() {});
    }

  }
  //播放后一秒的回调  一秒是用来避开闪黑屏
  void callback() async{
    //得到直播视频的宽高信息，用来得知是否全屏
    VideoInfo info=await _ijkMediaController.getVideoInfo();
    print("info:  $info");
    if(info.width<info.height)  _ijkMediaController.isFullScreen=true;
    else _ijkMediaController.isFullScreen=false;
    setState(() {
      print("刷新");
    });
  }
  //videoinfo的监听
  void videoinfoListener(VideoInfo info){
    print("监听info:  $info");
  }
  //设置PageView
  void initPageView(){
    _pageController = PageController(initialPage: 1);
    _pageController.addListener(() {
      if (_pageController.page != 0.0 && _pageController.page != 2.0) return;
      if (_pageController.page < 1)   offset--;
      else  offset++;
      update();
    });
  }
  //点击
  void update() async{
    int index=offset>0?offset:0-offset;
    index=offset%strs.length;
    await _ijkMediaController.reset();
    await _ijkMediaController.setNetworkDataSource(strs[index]);
    await _ijkMediaController.play();
    _pageController.jumpToPage(1);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ijkMediaController.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return Scaffold(
        body: PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        List<Widget> w=List();
        w.add(IjkPlayer(
            mediaController: _ijkMediaController,
            controllerWidgetBuilder: (controller) {
              return Container();
            },
            textureBuilder: (context,controller,info){
              return DefaultIJKPlayerWrapper(controller: controller,info: info);
            }
        ));
        if(index!=1||!isPlay){
          return Center(child: Text("此处有占位图"),);
        }
        return Stack(
          fit: StackFit.expand,
          children: w
        );
      },
      itemCount: 3,
      scrollDirection: Axis.vertical,
      controller: _pageController,
    ));
  }
}
