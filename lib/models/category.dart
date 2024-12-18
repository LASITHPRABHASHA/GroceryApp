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
    image: "images/shoes.png",
  ),
  Category(
    title: "Vegetables",
    image: "images/beauty.png",
  ),
  Category(
    title: "Beverages",
    image: "images/image1.png",
  ),
  Category(
    title: "Snacks",
    image: "images/jewelry.png",
  ),
];
