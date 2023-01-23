import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/main.dart';
import 'package:inshop_app/pages/subPages/itemPage.dart';

import '../../utils/pageRout.dart';

class CartPageScreen extends StatefulWidget {
  const CartPageScreen({super.key});

  @override
  State<CartPageScreen> createState() => _CartPageScreenState();
}

class _CartPageScreenState extends State<CartPageScreen> {
  List _items = [
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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 40,
        leading: GestureDetector(
          onTap: (){},
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Cart",
          style: GoogleFonts.saira(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 200,
            //   width: 370,
            //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

            //   // alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     color: Colors.grey.shade200,
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "My Address",
            //         style: GoogleFonts.saira(
            //           color: Colors.black,
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 1),
            //         child: Text(
            //           "My Address",
            //           style: GoogleFonts.saira(
            //             color: Colors.black,
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Wanna Buy These Products?"
                "\nClick on Buy Now",
                style: GoogleFonts.saira(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 470,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            _items[index] + "\nImage",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 100,
                          width: 215,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            _items[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 100,
              width: 370,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

              // alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SubTotal",
                      ),
                      Text(
                        "MRP Cost",
                      ),
                      Text(
                        "Total Cost",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "100",
                      ),
                      Text(
                        "10,0000000000",
                      ),
                      Text(
                        "9,99,99,999",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 55,
            )
          ],
        ),
      ),
    );
  }
}
