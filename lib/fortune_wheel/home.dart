import 'package:flutter/material.dart';

import 'item_prize.dart';
import 'spinning_wheel.dart';
import 'wheel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<ItemPrize> _items = [
    ItemPrize("1000\$", Colors.redAccent),
    ItemPrize("400\$", Colors.orangeAccent),
    ItemPrize("800\$", Colors.yellowAccent),
    ItemPrize("7000\$", Colors.greenAccent),
    ItemPrize("5000\$", Colors.blueAccent),
    ItemPrize("300\$", Colors.indigoAccent),
    ItemPrize("2000\$", Colors.purpleAccent),
    ItemPrize("100\$", Colors.amberAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fortune Wheel Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpinningWheel(
              // Wheel(
              //   items: _items,
              //   size: Size(300, 300),
              // ),
              Image.asset('assets/images/rolet.png'),
              size: Size(300, 300),
              dividers: 8,
              onUpdate: (index) {},
              list: _items,
              secondaryImage: Image.asset('assets/images/arrow.png'),
              secondaryImageHeight: 120,
              secondaryImageWidth: 120,
            ),
          ],
        ),
      ),
    );
  }
}
