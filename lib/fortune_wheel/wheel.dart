import 'dart:math';

import 'package:flutter/material.dart';

import 'item_prize.dart';

class Wheel extends StatefulWidget {
  final List<ItemPrize> items;

  const Wheel({
    Key key,
    this.items,
  }) : super(key: key);

  @override
  _WheelState createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  Size get size => Size(
        MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.width * 0.8,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black38)],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            for (var item in widget.items) ...[
              buildCard(
                widget.items.indexOf(item),
                widget.items.length,
                item.color,
                item.name,
              )
            ],
          ],
        ),
      ],
    );
  }

  buildCard(int index, int length, Color color, String text) {
    final double _rotation = (index / length) * 2 * pi;
    final double _angle = 2 * pi / length;

    return Transform.rotate(
      angle: _rotation,
      child: ClipPath(
        clipper: ArcPath(_angle),
        child: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: -pi / 2,
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 5, color: Colors.black)]),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [color, color.withOpacity(0)])),
        ),
      ),
    );
  }
}

class ArcPath extends CustomClipper<Path> {
  final double angle;

  ArcPath(this.angle);

  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    _path.moveTo(_center.dx, _center.dy);
    _path.arcTo(_rect, -pi / 2 - angle / 2, angle, false);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(ArcPath oldClipper) {
    return angle != oldClipper.angle;
  }
}
