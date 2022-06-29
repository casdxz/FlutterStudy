import 'package:flutter/material.dart';

// 植物小店
class PlantShop extends StatelessWidget {
  const PlantShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     // 构建脚⼿架，包含顶部appBar和body
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildHeader(),
          ),
          Positioned(
            top: 130,
            left: 20,
            right: 20,
            child: _buildSearch(),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height - 200,
            child: const Body(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.ac_unit),
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

  // 构建顶部Header
  Container _buildHeader() {
     // banner中的字体样式
    const style = TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
    return Container(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      height: 160,
      decoration: const BoxDecoration(
        color: const Color(0xFF0C9869),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Hi ⼩⿅扫描！',
            style: style,
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'images/share.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

//   构建搜索区
  Container _buildSearch() {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: const Color(0xFF0C9869)),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const TextField(
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF0C9869),
          ),
           // labelText: '搜索',
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 20,
            color: const Color(0xFF0C9869),
          ),
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
        Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(
            Icons.code,
            color: Colors.white,
          ),
        ),
      ],
      // leading:
    );
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
                  child: const Text('更多'),
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
                  child: const Text('更多'),
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
            image: 'images/kaffirLily.jpeg',
            title: '君⼦兰',
            country: '中国',
            price: 440,
          ),
          RecommendPlantCard(
            image: "images/angelica.jpeg",
            title: '当归',
            country: '中国',
            price: 440,
          ),
          RecommendPlantCard(
            image: "images/rose.jpeg",
            title: '萨曼沙',
            country: '俄罗斯',
            price: 440,
          ),
        ],
      ),
    );
  }
}

//封装热门推荐卡片
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
            image: "images/botany01.jpeg",
          ),
          FeaturePlantCard(
            image: "images/botany02.jpeg",
          ),
          FeaturePlantCard(
            image: "images/botany03.png",
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
