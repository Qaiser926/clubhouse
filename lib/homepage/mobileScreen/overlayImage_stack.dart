
import 'package:flutter/material.dart';

class StackedWidgets extends StatelessWidget {
  final double size;
  final List<Widget> items;
  final TextDirection direction;
  final double xShift;
  StackedWidgets({
    this.items,
    this.size=100,
    this.xShift=20,
    this.direction=TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    final allItems=items
        .asMap()
        .map((index,item) {
      final left=size-xShift;
      final value = Container(
        width: size,
        height: size,
        child: item,
        margin: EdgeInsets.only(left: left*index),
      );
      return MapEntry(index, value);
    }).values.toList();
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: direction==TextDirection.ltr
          ? allItems.reversed.toList():allItems,
    );
  }
}
