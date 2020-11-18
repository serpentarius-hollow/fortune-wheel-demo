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
    ItemPrize("100", Colors.redAccent),
    ItemPrize("200", Colors.orangeAccent),
    ItemPrize("300", Colors.yellowAccent),
    ItemPrize("400", Colors.greenAccent),
    ItemPrize("500", Colors.blueAccent),
    ItemPrize("600", Colors.indigoAccent),
    ItemPrize("700", Colors.purpleAccent),
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
              Wheel(
                items: _items,
                size: Size(300, 300),
              ),
              size: Size(300, 300),
              dividers: 6,
              onUpdate: (index) {
                // TODO: update selected index of items
              },
            ),
          ],
        ),
      ),
    );
  }
}
