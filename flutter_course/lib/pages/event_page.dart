
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  double _top = 0.0;
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户事件交互'),
      ),
      // body: Listener(
      //   child: Container(
      //     color: Colors.red,
      //     width: 300,
      //     height: 300,
      //   ),
      //   onPointerDown: (event) => print('down $event'),
      //   onPointerMove: (event) => print('moven $event'),
      //   onPointerUp: (event) => print('up $event'),
      // ),

      // body: Stack(
      //   children: [
      //     Positioned(
      //       top: _top,
      //       left: _left,
      //       child:GestureDetector(
      //         onTap: () => print('Tap'),
      //         onPanUpdate: (e) {
      //           print(e.delta.dx);
      //           // 拖动回调
      //           setState(() {
      //             _left += e.delta.dx;
      //             _top += e.delta.dy;
      //           });
      //         },
      //         child:Container(
      //           color: Colors.red,
      //             width: 100,
      //             height: 100,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      //
      // body: GestureDetector(
      //   onTap: () => print('Parent Tapped'),
      //   child: Container(
      //     color: Colors.blue,
      //     child: Center(
      //       child: GestureDetector(
      //         onTap: () => print('Child Tapped'),
      //         child: Container(
      //           color: Colors.yellow,
      //           width: 200,
      //           height: 200,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),


      // body: RawGestureDetector(
      //   gestures: {
      //     // 建立手势识别器和手势识别工厂类的映射关系
      //     MultiTapGestureRecognizer : GestureRecognizerFactoryWithHandlers<MultiTapGestureRecognizer>(
      //         () => MultiTapGestureRecognizer(),
      //             (MultiTapGestureRecognizer instance) {
      //               instance.onTap = () => print('Parent Tapped');
      //         }
      //     )
      //   },
      //   child: Container(
      //     color: Colors.pink,
      //     child: Center(
      //       child: GestureDetector(
      //         onTap: () {
      //           print("child Tapped");
      //         },
      //         child: Container(
      //           color: Colors.blue,
      //           width: 200,
      //           height: 200,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

    body: GestureDetector(
      onDoubleTap: () {
        print("onDoubleTap ");
      },
      child: Container(
        child: ElevatedButton(
          onPressed: () => print('button onPressed'),
          child: Text(
            "button"
          ),
        ),
      ),
    ),
    );
  }
}
// 自定义手势识别器
class MultiTapGestureRecognizer extends TapGestureRecognizer{
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer); //手动把自己复活
  }
}
