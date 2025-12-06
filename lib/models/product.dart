class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final String assetImage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.assetImage,
  });

  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'assetImage': assetImage,
    };
  }

  // Create Product from Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      assetImage: map['assetImage'],
    );
  }
}
