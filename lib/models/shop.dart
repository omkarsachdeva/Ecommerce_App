import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

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
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  static get imagePath => null;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
