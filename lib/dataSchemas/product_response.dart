class Product {
  final String id;
  final String name;
  final String description;
  final String type;
  final String banner;
  final int unit;
  final double price;
  final bool available;
  final String supplier;
  final String availableForGender;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.banner,
    required this.unit,
    required this.price,
    required this.available,
    required this.supplier,
    required this.availableForGender,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      description: json['desc'],
      type: json['type'],
      banner: json['banner'],
      unit: json['unit'],
      price: json['price'].toDouble(),
      available: json['available'],
      supplier: json['suplier'],
      availableForGender: json['availableForGender'],
    );
  }
}