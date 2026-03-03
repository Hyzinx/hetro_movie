import 'package:flutter/material.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_category/category_widget.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({super.key});

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  final List<String> listCategory = [
    "Now playing",
    "Upcoming",
    "Top rated",
    "Popular",
  ];

  int selectedIndex = 0;

  void onSelectedCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          listCategory.length,
          (index) => CategoryWidget(
            categoryName: listCategory[index],
            isSelected: index == selectedIndex,
            onSelected: () => onSelectedCategory(index),
          ),
        ),
      ),
    );
  }
}
