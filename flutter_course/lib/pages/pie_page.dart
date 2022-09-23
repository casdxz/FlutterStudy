import 'dart:math';

import 'package:flutter/material.dart';

class PiePage extends StatelessWidget {
  const PiePage({Key? key}) : super(key: key);

  get charts => null;

  Widget _Pie() {
    var random = Random();

    var data = [
      PieSales(0, random.nextInt(100)),
      PieSales(1, random.nextInt(100)),
      PieSales(2, random.nextInt(100)),
      PieSales(3, random.nextInt(100)),
      PieSales(4, random.nextInt(100)),
      PieSales(5, random.nextInt(100)),
      PieSales(6, random.nextInt(100)),
      PieSales(7, random.nextInt(100)),
      PieSales(8, random.nextInt(100)),
      PieSales(9, random.nextInt(100)),
    ];

    var seriesList = [
      charts.Series<PieSales, int>(
        id: 'Sales',
        domainFn: (PieSales sales, _) => sales.year,
        measureFn: (PieSales sales, _) => sales.sales,
        data: data,
      )
    ];

    return charts.PieChart(seriesList, animate: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("饼图")),
      body: Column(children: [
        SizedBox(
          height: 300,
          child: _Pie(),
        ),
      ]),
    );
  }
}

class PieSales {
  final int year;
  final int sales;

  PieSales(this.year, this.sales);
}
