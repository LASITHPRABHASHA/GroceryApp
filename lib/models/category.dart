class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "Fruits",
    image: "images/fruits/Apple.png",
  ),
  Category(
    title: "Vegetables",
    image: "images/vegetables/Carrots.jpg",
  ),
  Category(
    title: "Beverages",
    image: "images/beverages/CocaCola.png",
  ),
  Category(
    title: "Snacks",
    image: "images/snacks/FrenchFries.png",
  ),
];
