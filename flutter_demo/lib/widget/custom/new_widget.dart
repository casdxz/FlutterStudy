import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/custom/tag.dart';

// 封装分类页面中列表中的每个Container组件
// ignore: must_be_immutable
class NewWidget extends StatelessWidget {
  NewContainer info;

  NewWidget(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      // 装饰整个Container
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: info.color),
        color: info.color.withAlpha(77),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      // color: info.color,
      height: 90,
      alignment: Alignment.topRight,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedOverflowBox(
              alignment: Alignment.center,
              size: Size.zero,
              child: Padding(
                padding: const EdgeInsets.only(left: 260.0),
                child: Tag(
                  color: Colors.blue.shade600,
                  shadowHeight: 16.0,
                  size: const Size(25, 30),
                ),
              ),
            ),
            ListTile(
              // 左侧leading图标区，用一个Container来绘制一个圆形，文字为标题的第一个字母
              leading: Container(
                width: 70,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    DecoratedBox(
                      decoration: ShapeDecoration(
                        shadows: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                        color: Colors.blue[50],
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 3.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        alignment: Alignment.center,
                        child: Text(
                          info.title.substring(0, 2),
                          style: TextStyle(
                              fontSize: 20,
                              color: info.color,
                              fontWeight: FontWeight.w500,
                              shadows: const [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(.2, .2),
                                  blurRadius: 2,
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                      width: 70,
                      child: Row(
                        children: <Widget>[
                          ClipPath(
                            clipper:
                                ShapeBorderClipper(shape: _StarShapeBorder()),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: info.color,
                            ),
                          ),
                          ClipPath(
                            clipper:
                                ShapeBorderClipper(shape: _StarShapeBorder()),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: info.color,
                            ),
                          ),
                          ClipPath(
                            clipper:
                                ShapeBorderClipper(shape: _StarShapeBorder()),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: info.color,
                            ),
                          ),
                          ClipPath(
                            clipper:
                                ShapeBorderClipper(shape: _StarShapeBorder()),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: info.color,
                            ),
                          ),
                          ClipPath(
                            clipper:
                                ShapeBorderClipper(shape: _StarShapeBorder()),
                            child: Container(
                              width: 10,
                              height: 10,
                              color: info.color,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              title: Text(
                info.title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                info.subTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              selected: false,
              contentPadding: const EdgeInsets.all(5),
              trailing: const Icon(Icons.arrow_forward_ios),
              dense: false,
              onTap: () => {Navigator.pushNamed(context, info.url)},
            ),
          ],
        ),
      ),
    );
  }
}

class NewContainer {
  late String title;
  late String subTitle;
  late String url;
  late Color color;

  NewContainer(this.title, this.subTitle, this.url, this.color);
}

class _StarShapeBorder extends ShapeBorder {
  final Path _path = Path();

  @override
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      nStarPath(5, rect.height / 2, rect.height / 2 * 0.5,
          dx: rect.width / 2, dy: rect.height / 2);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(doublet) {
    throw UnimplementedError();
  }

  Path nStarPath(int num, double R, double r, {dx = 0, dy = 0}) {
    double perRad = 2 * pi / num;
    double radA = perRad / 2 / 2;
    double radB = 2 * pi / (num - 1) / 2 - radA / 2 + radA;
    _path.moveTo(cos(radA) * R + dx, -sin(radA) * R + dy);
    for (int i = 0; i < num; i++) {
      _path.lineTo(
          cos(radA + perRad * i) * R + dx, -sin(radA + perRad * i) * R + dy);
      _path.lineTo(
          cos(radB + perRad * i) * r + dx, -sin(radB + perRad * i) * r + dy);
    }
    _path.close();
    return _path;
  }
}
