class CategoryList {
  final String name;
  CategoryList(this.name);
}

final List<CategoryList> categoryMovie = [
  CategoryList("Now playing"),
  CategoryList("Upcoming"),
  CategoryList("Top rated"),
  CategoryList("Popular"),
];
final List<CategoryList> categoryDetail = [
  CategoryList("About Movie"),
  CategoryList("Reviews"),
  CategoryList("Cast"),
];
