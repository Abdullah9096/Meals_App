import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color backgColor;

  const Category({
    @required this.id,
    @required this.name,
    this.backgColor = Colors.orange,
  });
}
