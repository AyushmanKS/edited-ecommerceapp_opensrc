import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String description;
  final AssetImage? image;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      this.image});
}
