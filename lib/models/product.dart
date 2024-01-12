class Product {
  final int id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final String color;
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imgUrl, 
    required this.color,
    required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      imgUrl: json['imgUrl'],
      color: json['color'],
      isFavorite: json['isFavorite'],
    );
  }
}
