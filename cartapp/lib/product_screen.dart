// product_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'product.dart';
import 'cart_screen.dart'; // Import the CartScreen

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> availableProducts = [
      Product(id: '1', name: 'Table', price: 1000.0),
      Product(id: '2', name: 'Chair', price: 750.0),
      Product(id: '3', name: 'Laptop', price: 30000.0),
      Product(id: '4', name: 'Keyboard', price: 2000.0),
      Product(id: '5', name: 'Mouse', price: 1450.0),
      Product(id: '6', name: 'Graphic Card', price: 50000.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()), // Navigate to the CartScreen
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          Product product = availableProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('₹${product.price.toStringAsFixed(2)}'), // Change currency symbol to ₹
            trailing: AddToCartButton(product: product), // Use a custom widget for the button
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

class AddToCartButton extends StatefulWidget {
  final Product product;

  const AddToCartButton({Key? key, required this.product}) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: addedToCart ? Icon(Icons.done) : Icon(Icons.add),
      onPressed: () {
        setState(() {
          addedToCart = true;
        });
        Provider.of<Cart>(context, listen: false).addToCart(widget.product);
      },
    );
  }
}
