import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class AboutListTileWidget extends StatefulWidget {
  const AboutListTileWidget({Key? key}) : super(key: key);

  @override
  State<AboutListTileWidget> createState() => _AboutListTileWidgetState();
}

class _AboutListTileWidgetState extends State<AboutListTileWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutListTile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '关于应用条目组件',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: const Text(
                  'Flutter提供的一个通用列表条目结构，可指定应用图标、应用名、应用版本号等信息和内部的子组件列表。',
                  style: descStyle,
                ),
              ),
              const AboutListTile(
                icon: Icon(Icons.info),
                applicationIcon: FlutterLogo(),
                applicationName: 'Flutter Demo',
                applicationVersion: '1.1.1+2',
                applicationLegalese: 'Copyright@ 2022-2023 走进Flutter',
                  aboutBoxChildren: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Flutter是Google开源的构建用户界面（UI）工具包，帮助开发这通过一套代码库高效构建多平台精美应用，'
                            '支持移动、Web、桌面和嵌入式平台。 Flutter开源、免费。拥有宽松的开源协议，使用商业项目。'
                            'Flutter已经推出稳定的3.0版本。',
                        style: descStyle,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
              )
            ],
          ),
        ),
      ),
    );
  }
}