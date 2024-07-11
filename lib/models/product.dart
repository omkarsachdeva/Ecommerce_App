class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  int quantity; // Add a quantity field to keep track of item count in the cart

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    this.quantity = 1, // Default quantity to 1
  });

  // Method to convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }

  // Factory constructor to create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imagePath: json['imagePath'],
      quantity: json['quantity'],
    );
  }
}
