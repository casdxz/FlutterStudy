import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class CupertionWidget extends StatelessWidget {
  const CupertionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> rainbow =[
      0xffff0000,
      0xffFF7F00,
      0xffFFFF00,
      0xff00FF00,
      0xff00FFFF,
      0xff0000FF,
      0xff8B00FF,
    ];

    final List<double> stops = [0.0, 1/6, 2/6, 3/6, 4/6, 5/6, 1.0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CupertionWidget'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '1、CupterionAlertDialog',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'iOS风格通用对话框，可指定头、中、尾部的组件。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            _buildCupertionAlertDialog(context));
                  },
                child: Text('点击弹出CupertionAlertDialog'),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                '2、CupterionActionSheet',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'iOS风格的弹出选择结构，客房多个按钮，一般与CupterionActionSheetAction联用。',
                  style: descStyle,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          _buildCupertionActionSheet(context));
                },
                child: Text('点击弹出CupterionActionSheet'),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                '3、CupertionPopupSurface',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'iOS弹出框的圆角矩形模糊背景。',
                  style: descStyle,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.8,
                    stops: stops,
                    colors: rainbow.map((e) => Color(e)).toList()
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10,
                  children: [
                    _buildCupertionPopupSurface(false),
                    _buildCupertionPopupSurface(true),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCupertionAlertDialog(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
        title: _buildTitle(context),
        content: _buildContent(context),
        actions: [
          CupertinoButton(
              child: Text('Delete'), onPressed: () => Navigator.pop(context)),
          CupertinoButton(
              child: Text('Cancel'), onPressed: () => Navigator.pop(context)),

        ],
      ),
    );
  }
  Widget _buildTitle(BuildContext context){
    return Row(
      children: [
        Icon(
          CupertinoIcons.delete_solid,
          color: Colors.red,
        ),
        Expanded(
          child: Text(
            'DELETE FILE',
            style: titleStyle,
          )
        ),
        InkWell(
          child: Icon(CupertinoIcons.clear_thick),
          onTap: () => Navigator.pop(context),
        )
      ],
    );
  }
  Widget _buildContent(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 18),
      child: Column(
        children: <Widget>[
          Text(
            '点击Delete将删除该文件，确定继续删除吗？',
            style: descStyle,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
  //
  Widget _buildCupertionActionSheet(BuildContext context){
    return Container(
      alignment: Alignment.bottomCenter,
      child: CupertinoActionSheet(
        title: Text(
          'Please choose a language!',
          style: titleStyle,
        ),
        message: Text(
          'the language you use in this application',
          style: descStyle,
        ),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text('Java'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text('Lotlin'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text('Flutter'),
          ),
        ],
      ),
    );
  }

  Widget _buildCupertionPopupSurface(bool isSurfacePainted) {
    return CupertinoPopupSurface(
      //是否绘白
      isSurfacePainted: isSurfacePainted,
      child: Container(
        width: 150,
        height: 100,
        color: Colors.white.withOpacity(0.3),
        alignment: Alignment.center,
      ),
    );
  }
}
