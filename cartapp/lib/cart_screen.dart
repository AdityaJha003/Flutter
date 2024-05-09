// cart_screen.dart
import 'package:cartapp/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> cartProducts = Provider.of<Cart>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          Product product = cartProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('₹${product.price.toStringAsFixed(2)}'), // Change currency symbol to ₹
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).removeFromCart(product);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow, // Change bottom navigation bar color to yellow
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Total: ₹${Provider.of<Cart>(context).totalPrice.toStringAsFixed(2)}', // Change currency symbol to ₹
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
