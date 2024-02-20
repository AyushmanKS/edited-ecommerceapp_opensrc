import 'package:ecommerce_app_opensrc/screens/cart_screen.dart';
import 'package:ecommerce_app_opensrc/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
                (route) => false,
              );
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
