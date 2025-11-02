class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final String? assetImage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.assetImage,
  });
}
