import 'package:ecommerce_app_opensrc/data/dummy_products.dart';
import 'package:ecommerce_app_opensrc/screens/products_grid_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;
  Map<int, int> quantityMap = {}; // Map to store product quantity

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    total = dummyProducts.fold(
        0, (previousValue, product) => previousValue + product.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
                (route) => false,
              );
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductsGridScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final product = dummyProducts[index];
                final productId = product.hashCode;
                final quantity =
                    quantityMap[productId] ?? 5; // Default quantity = 5

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: product.image,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 0) {
                                quantityMap[productId] = quantity - 1;
                              }
                            });
                          },
                          icon: const Icon(Icons.remove_circle_outline_rounded,
                              size: 30),
                        ),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantityMap[productId] = quantity + 1;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline_rounded,
                              size: 30),
                        ),
                      ],
                    ),
                    title: Text(
                      product.name.toString(),
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    subtitle: Text('Price: ₹${dummyProducts[0].price}'),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          _CartTotal(totalPrice: total),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final double totalPrice;

  const _CartTotal({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Total: ₹ ${totalPrice.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 35, color: Colors.white),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "BUY",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}
