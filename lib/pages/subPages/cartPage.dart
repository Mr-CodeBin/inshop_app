import 'package:flutter/material.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  final List _items = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
    'item 6',
    'item 7',
    'item 8',
    'item 9',
    'item 10',
  ];
  List _cartItems = [];
  get shopitems => _items;
  get cartItems => _cartItems;

  void addAnItemFromCart(int index) {
    _cartItems.add(_items[index]);
    // notifyListeners();
  }

  void removeAnItemFromCart(int index) {
    _cartItems.removeAt(index);
    // notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    _items[index],
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
