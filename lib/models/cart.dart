class Article{
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  int quantity;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity
  });
}