import 'package:flutter/material.dart';

import 'item_prize.dart';
import 'wheel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size get size => Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      );

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
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Wheel(
                  items: _items,
                ),
              ),
              Container(
                width: size.width,
                child: RaisedButton(
                  child: Text('Spin!'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
