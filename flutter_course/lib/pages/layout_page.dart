import 'package:flutter/material.dart';
import 'package:flutter_course/common/style.dart';
import 'package:flutter_course/widget/likelist.dart';
import 'package:flutter_course/widget/mylist.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 240,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo.shade300,
                  Colors.indigo.shade500,
                ],
              ),
            ),
          ),
          ListView.builder(
            itemCount: 7,
            itemBuilder: _buildBody,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    if (index == 0) return _buildHeader(context);
    if (index == 1) return _buildSectionHeader(context);
    if (index == 2) return _buildCollectionRow(context);
    if (index == 3)
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Text(
          'Most Liked Posts',
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    return _buildListItem();
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50,),
      height: 280,
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(40),
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Flutter 布局',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'UI Designer | Flutter Developer',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: Text(
                                '302',
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                'POST'.toUpperCase(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                '10.3K',
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                'FOLLLOWER'.toUpperCase(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                '120',
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                'FOLLOWING'.toUpperCase(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 12,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://bearcad.oss-cn-shanghai.aliyuncs.com/%E5%A4%B4%E5%83%8F/%E6%88%91%E7%9A%84%E5%A4%B4%E5%83%8F/share.jpg',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      // crossAxisAlignment: CrossAxisAlignment.start,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text(
                'Collection',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Text(
                'Create new',
                style: titleStyle,
              ),
            ],
          ),
          MyList(),
        ],
      ),
    );

  }

  Widget _buildCollectionRow(BuildContext context) {
    return Container(
      height: 1050.0,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Most liked posts',
            style: Theme.of(context).textTheme.headline4,
          ),
          LikeList(),
        ],
      ),
    );
  }

  Widget _buildListItem() {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.blue.shade100,
                height: 80,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }
        ),
      ],
    );
  }
}
