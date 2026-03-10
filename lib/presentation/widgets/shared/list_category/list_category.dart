import 'package:flutter/material.dart';
import 'package:hetro_anime/presentation/model/category.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_category/category_widget.dart';


class ListCategory extends StatefulWidget {
   const ListCategory({
    super.key,
    required this.categoryList,
    required this.onSelectedCategory,
    required this.selectedCategory,
  });
  final Function(int) onSelectedCategory;
  final int selectedCategory;
  final List<CategoryList> categoryList;

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.categoryList.length,
          (index) => CategoryWidget(
            categoryName: widget.categoryList[index].name,
            isSelected: index == widget.selectedCategory,
            onSelected: () {
              widget.onSelectedCategory(index);
            },
          ),
        ),
      ),
    );
  }
}
