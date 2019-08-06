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
  int offset = 0;

//  bool _isFinish;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        VideoPlayerController.network("https://www.w3school.com.cn/i/movie.mp4")
          ..initialize().then((e) {
            setState(() {});
          });
    _controller.setLooping(true);

    _pageController = PageController(initialPage: 1);
    _pageController.addListener(() {
      if (_pageController.page != 0.0 && _pageController.page != 2.0) return;
      if (_pageController.page < 1) {
        print("上移");
        offset--;
      } else {
        print("下移");
        offset++;
      }
      setState(() {
        _pageController.jumpToPage(1);
        print("page:  ${_pageController.page}");
      });
    });

    print("person:  ${Beans.personBeanList}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    _isFinish=true;
    // TODO: implement build
    return Scaffold(
//      body: AspectRatio(aspectRatio: _controller.value.aspectRatio,child: VideoPlayer(_controller)),
//     body: ,
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller)),
              Positioned(left: 20, top: 20, child: Text("第${index + offset}页",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
            ],
          );
        },
        itemCount: 3,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        onPageChanged: (int i) {},
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
