import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProfileFourPage extends StatelessWidget {
  const ProfileFourPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 380,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/bear.png'),
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.7),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              _buildAvatar(
                'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head1.png'
              ),
              const SizedBox(height: 10.0),
              Text(
                "Bear",
                style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                "Flutter & Full Stack Developer",
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Card(
                color: Colors.white70,
                elevation: 10,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "266K",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "106K",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Following",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Favorite",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFavoriteCard(context, "Design"),
                    const SizedBox(width: 10),
                    _buildFavoriteCard(context, "Fruits"),
                    const SizedBox(width: 10),
                    _buildFavoriteCard(context, "Nature"),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Friends",
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: Stack(
                  children: [
                    ...avatars
                        .asMap()
                          .map(
                            (i, e) => MapEntry(
                              i,
                              Transform.translate(
                                offset: Offset(i * 30.0, 0),
                                child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: _buildAvatar(e, radius: 30)),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: () {},
      ),
    );
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 5,
        backgroundImage: NetworkImage(image),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, String title) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 4,
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head7.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
              foregroundDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> avatars =  [
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head2.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head3.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head4.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head5.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head6.png',
];

