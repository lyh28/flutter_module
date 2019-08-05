import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_module/Bean/PubBeans.dart';
class Mp4Video extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Mp4VideoState();
  }
}

class Mp4VideoState extends State<Mp4Video> {
  VideoPlayerController _controller;
  PageController _pageController;
  int _count;
  int lastindex;
  List list=["首页","动态","新歌声","我的"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("person:  ${Beans.personBeanList}");
    _controller =
        VideoPlayerController.network("https://www.w3school.com.cn/i/movie.mp4")
          ..initialize().then((e) {
            setState(() {});
          });
    _controller.setLooping(true);
    _pageController=PageController(initialPage: 1,viewportFraction: 1);
    _pageController.addListener((){

    });
    _count = 3;
    lastindex=0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      body: AspectRatio(aspectRatio: _controller.value.aspectRatio,child: VideoPlayer(_controller)),
//     body: ,
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller));
        },
//          if(lastindex>=list.length)
//            lastindex=0;
//          if(lastindex<0)
//            lastindex=list.length-1;
//          return Text(list[lastindex]);
//        },
        itemCount: _count,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        onPageChanged: (int i) {
          setState(() {
            print("page:  $i");
//            if(i<1){
//              lastindex--;
//              _pageController.jumpToPage(1);
//            }else{
//              lastindex++;
//              _pageController.jumpToPage(1);
//            }
//            _count++;
//            print("count:  $_count");
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
