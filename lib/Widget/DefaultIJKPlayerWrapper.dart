import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter/material.dart';
class DefaultIJKPlayerWrapper extends StatelessWidget {
  final IjkMediaController controller;
  final VideoInfo info;
  const DefaultIJKPlayerWrapper({
    Key key,
    this.controller,
    this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = info?.ratio ?? 1280 / 720;
    final size=MediaQuery.of(context).size;
    print("宽高比：  $size   $ratio    ${info.ratio}   ${info.width}" );
    var id = controller.textureId;
    if (id == null) {
      return AspectRatio(
        aspectRatio: ratio,
        child: Container(
          color: Colors.white,
        ),
      );
    }
    double infoW=info.ratio*size.height;
    Rect rect=Rect.fromLTWH(0-(infoW-size.width)/2, 0, infoW, size.height);
    Widget w = Container(
      height: size.height,
      color: Colors.white,
      child: Texture(
        textureId: id,
      ),
    );
    if (!controller.autoRotate) {
      return w;
    }
//    Rect rect=Rect.fromLTWH((info.width-size.width)/2, 0, info.width+0.0, info.height+0.0);
    if(controller.isFullScreen)
//      return Stack(children: <Widget>[Positioned.fromRect(child: w,rect: rect)]);
      return w;
    int degree = info?.degree ?? 0;

    if (ratio == 0) {
      ratio = 1280 / 720;
    }

    w = AspectRatio(
      aspectRatio: ratio,
//    fit: BoxFit.fitHeight,
      child: w,
    );
    if (degree != 0) {
      w = RotatedBox(
        quarterTurns: degree ~/ 90,
        child: w,
      );
    }
    return Container(
      child: Center(child: w,),
      color: Colors.white,
    );
  }
}