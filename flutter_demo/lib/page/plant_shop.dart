import 'package:flutter/material.dart';


class PlantShop extends StatelessWidget {
  const PlantShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // banner中的字体样式
    const style = TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
    // 构建脚手架，包含顶部appBar和body
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // ⻉塞尔弧形部分
            ClipPath(
              // 裁剪，使⽤⾃定义的类构建⻉塞尔弧形
              clipper: BottomClipper(),
              child: Container(
                // 通过内边距让⽂字上移
                padding: const EdgeInsets.only(
                  bottom: 50.0,
                ),
                // 和appBar背景⾊保持⼀致，融为⼀体
                color: const Color(0xFF0C9869),
                height: 200,
                child: Column(
                  children: [
                    Row(
                      // 主轴和交叉轴的对⻬⽅式
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                      // Row布局，左⽂右图
                      Text(
                        'Hi ⼩⿅扫描！',
                        style: style,
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://cdn.jsdelivr.net/gh/casdxz/image@master/head/share.webp',
                          ),
                        ),
                      ),
                    ]
                  ),
                // const SizedBox(
                // height: 30.0,
                // ),
                ],
              )),
            ),

            // Body类构建下⾯的热⻔推荐和特⾊植物
            const Body(),
          ],
        ),
    ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.local_florist),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ], //均分底部导航栏横向空间
        ),
      ),
    );
  }

  // 构建顶部appBar的私有⽅法
  AppBar _buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF0C9869),
      actions: const [
        Icon(
          Icons.code,
          color: Colors.white,
        ),
      ],
      // leading:
    );
  }
}

// ⾃定义裁剪路径，通过⻉塞尔曲线构建弧形
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第⼀个点
    path.lineTo(0, size.height - 60); //第⼆个点
    var firstControlPoint = Offset(size.width / 2, size.height); //曲线开始点
    var firstEndPoint = Offset(size.width, size.height - 60); // 曲线结束点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - 60); //第四个点
    path.lineTo(size.width, 0); // 第五个点
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Body类构建
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 标题字体
    var titleStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );
    // 纵向滚动视图，两部分组成：热⻔推荐和特⾊植物
    return SingleChildScrollView(
      // 纵向 + Column布局
      scrollDirection: Axis.vertical,
      child: Column(
        // ⽔平⽅向（交叉轴）左对⻬
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '热⻔推荐',
                  style: titleStyle,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0C9869),
                  ),
                  child: const Text('查看更多'),
                ),
              ],
            ),
          ),
          // RecommendsPlants类，⽤于构建横向滚动的热⻔推荐区域
          const RecommendsPlants(),
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '特⾊植物',
                  style: titleStyle,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0C9869),
                  ),
                  child: const Text('查看更多'),
                ),
              ],
            ),
          ),
          const FeaturedPlants(),
          // const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
//构建热⻔推荐

class RecommendsPlants extends StatelessWidget {
  const RecommendsPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ⽔平滚动视图
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const <Widget>[
          // 调⽤封装的⾃定义组件，传⼊参数值
          RecommendPlantCard(
            image: 'images/banner.jpg',
            title: '君⼦兰',
            country: '中国',
            price: 440,
          ),
          RecommendPlantCard(
            image: "images/banner.jpg",
            title: '当归',
            country: '中国',
            price: 440,
          ),
          RecommendPlantCard(
            image: "images/banner.jpg",
            title: '萨曼沙',
            country: '俄罗斯',
            price: 440,
          ),
        ],
      ),
    );
  }
}

class RecommendPlantCard extends StatelessWidget {
  //ignore: use_key_in_widget_constructors

  const RecommendPlantCard({
    required this.image,
    required this.title,
    required this.country,
    required this.price,
  });

  final String image, title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.indigo.withOpacity(0.66),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      title.toString(),
                      style: Theme.of(context).textTheme.button,
                    ),
                    Text(
                      country.toString(),
                      style: TextStyle(
                        color: Colors.indigo.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.green),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 构建特⾊植物区域

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          // 调⽤封装的⾃定义组件，传⼊图⽚地址
          FeaturePlantCard(
            image: "images/plant1.jpg",
          ),
          FeaturePlantCard(
            image: "images/plant2.jpg",
          ),
          FeaturePlantCard(
            image: "images/plant3.jpg",
          ),
        ],
      ),
    );
  }
}

// ⾃定义类，定义图⽚地址，使⽤卡⽚构建
class FeaturePlantCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FeaturePlantCard({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      height: 320,
      // child: Image.asset(image),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
// FeaturedPlants类，⽤于构建纵向滚动的特⾊植物区域
