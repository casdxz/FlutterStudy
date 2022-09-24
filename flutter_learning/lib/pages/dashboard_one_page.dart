import 'package:flutter/material.dart';

const TextStyle whiteText = TextStyle(
  color: Colors.white,
);

class DashboardOnePage extends StatelessWidget {
  const DashboardOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        // 底部背景容器
        Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.indigo.withOpacity(0.3),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://bearcad.oss-cn-shanghai.aliyuncs.com/phoneBanner/banner01.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        //背景图上层滚动视图容器
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 130, left: 16, right: 16),
            child: Column(
              children: <Widget>[
                _buildHeader(),
                const SizedBox(height: 50),
                _buildRow(context),
                const SizedBox(height: 10),
                _buildRow(context),
              ],
            ),
          )
        )
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(8),
          child: CircularProgressIndicator(
            value: 0.55,
            valueColor: AlwaysStoppedAnimation(
              Colors.deepPurple.withOpacity(0.8),
            ),
            backgroundColor: Colors.white54,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Task\nDaily Progress",
                style: whiteText.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                "45% to go",
                style: whiteText.copyWith(fontSize: 16),
              ),
            ],
          )
        )
      ],
    );
  }

  Row _buildRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              CardItem(
                title: '9,850',
                icon: Icons.sports_basketball,
                desc: 'Steps',
                height: 190,
                color: Colors.pink.shade300.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              CardItem(
                title: '70 bpm',
                icon: Icons.favorite,
                iconColor: Colors.red,
                desc: 'Avg. Heart Rate',
                height: 120,
                color: Colors.cyan.withOpacity(0.5),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: <Widget>[
              CardItem(
                title: '2,430',
                icon: Icons.watch,
                desc: 'Calories Burned',
                height: 120,
                color: Colors.amber.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              CardItem(
                title: '15 kms',
                icon: Icons.hotel,
                desc: 'Distance',
                height: 190,
                color: Colors.green.shade400.withOpacity(0.5),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  String title;
  IconData icon;
  String desc;
  Color? color;
  Color? iconColor;
  double height;

  CardItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.desc,
    this.color = Colors.blue,
    this.iconColor = Colors.white,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Theme.of(context).textTheme.displayLarge!.copyWith(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      height: height,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(title, style: titleStyle),
            trailing: Icon(icon, color: iconColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(desc, style: whiteText),
          )
        ],
      ),
    );
  }
}
