import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "SunSeeker Shades",
        price: 99.99,
        description: "Stylish protection for sunny adventures..",
        imagePath: 'assets/glare.png'),
    Product(
        name: "UrbanCozy Hoodies",
        price: 80.99,
        description: "Stay warm and stylish anywhere..",
        imagePath: 'assets/hoodie.png'),
    Product(
        name: "TrendTrek Shoes",
        price: 109.99,
        description: "Fashionable footwear for every journey..",
        imagePath: 'assets/shoe.png'),
    Product(
        name: "UrbanNomad Bags",
        price: 100.99,
        description: "Your perfect companion for city travels.",
        imagePath: 'assets/bag.png'),
    Product(
        name: "TrendTickers",
        price: 120.99,
        description: "Stay stylish, stay punctual..",
        imagePath: 'assets/watch.png'),
    Product(
        name: "CasualCrest T-Shirts",
        price: 65.99,
        description: "Cool and comfy all day..",
        imagePath: 'assets/tshirt.png'),
    Product(
        name: "UrbanFit Trousers",
        price: 70.99,
        description: "Versatile and durable wear.",
        imagePath: 'assets/trousers.png'),
    Product(
        name: "SmartHeat Microwave",
        price: 150.99,
        description: "Innovative technology for your kitchen.",
        imagePath: 'assets/micro.png'),
  ];

  List<Product> _cart = [];

  Shop() {
    _loadCart();
  }

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    var existingItem = _cart.firstWhere((element) => element.name == item.name,
        orElse: () =>
            Product(name: '', price: 0, description: '', imagePath: ''));
    if (existingItem.name.isNotEmpty) {
      existingItem.quantity += 1;
    } else {
      _cart.add(item);
    }
    _saveCart();
    notifyListeners();
  }

  void removeFromCart(Product item) {
    var existingItem = _cart.firstWhere((element) => element.name == item.name);
    if (existingItem.quantity > 1) {
      existingItem.quantity -= 1;
    } else {
      _cart.remove(item);
    }
    _saveCart();
    notifyListeners();
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartItems =
        _cart.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cart', cartItems);
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('cart');
    if (cartItems != null) {
      _cart =
          cartItems.map((item) => Product.fromJson(jsonDecode(item))).toList();
    }
    notifyListeners();
  }
}

extension on Product {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imagePath: json['imagePath'],
      quantity: json['quantity'],
    );
  }
}
