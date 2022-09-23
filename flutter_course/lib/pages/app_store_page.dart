import 'package:flutter/material.dart';

import '../mock/update_list.dart';

class AppStorePage extends StatefulWidget {
  const AppStorePage({Key? key}) : super(key: key);

  @override
  State<AppStorePage> createState() => _AppStorePageState();
}

class _AppStorePageState extends State<AppStorePage> {
  bool expand = false;
  int maxLines = 1;
  final style = const TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.blue.shade50,
        // foregroundColor: Colors.black87,
        title: const Text('Updates'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return _buildItem(context, items[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            );
          },
          itemCount: items.length),
    );
  }

  Widget _buildItem(BuildContext context, UpdateList model) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 图片圆角
                child: Image.network(
                  model.appIcon,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              //Expanded控件，用来拉伸中间区域
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                crossAxisAlignment: CrossAxisAlignment.start, //水平方向居左对齐
                children: <Widget>[
                  Text(
                    model.appName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16.0),
                  ), //App名字
                  Text(
                    model.appDate,
                    maxLines: 1,
                  ), //App更新日期
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10), //右边距为10，其余均为0
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blue),
                ),
                onPressed: () {},
                child: const Text("UPDATE"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LayoutBuilder(
                builder: (context, size) {
                  final painter = TextPainter(
                    text: TextSpan(text: model.appDescription, style: style),
                    maxLines: maxLines,
                    textDirection: TextDirection.ltr,
                  );
                  painter.layout(maxWidth: size.maxWidth);
                  if (!painter.didExceedMaxLines) {
                    return Text(model.appDescription, style: style);
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(model.appDescription,
                          maxLines: expand ? null : 1, style: style),
                      GestureDetector(
                        onTap: () => setState(() {
                          expand = !expand;
                        }),
                        child: Text(
                          expand ? '收起' : '展开',
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                },
              ),
              // Text(model.appDescription),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Version:${model.appVersion} · ${model.appSize} MB",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
