import '../widgets/categoryItem.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      children: DUMMY_CATEGORIES.map((cate) {
        return CategoryItem(cate.id, cate.name, cate.backgColor);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
