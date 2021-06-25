import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_routes_and_themes/generated/l10n.dart';
import 'package:learning_routes_and_themes/src/screen/shopping_cart.dart';

class Product extends StatelessWidget {
  static const String routeName = '/product';

  String get kProductTitle => S.current.productTitle;

  Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kProductTitle),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ShoppingCart.routeName);
              },
              icon: Icon(Icons.shopping_bag))
        ],
      ),
      body: Center(
        child: Container(
          height: 550,
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 0.7, color: Colors.grey.shade400),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 93,
                  height: 28,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Offerta',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'arial',
                          fontSize: 21),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 200,
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Saugella Attiva Flacone 250 Ml',
                  style: TextStyle(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontSize: 32),
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: '€ 8,59 ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '€ 9,60',
                              style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough))
                        ],
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: GoogleFonts.roboto().fontFamily))),
                    Expanded(child: SizedBox()),
                    Text(
                      '10% off',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: Text(
                      'Aggiungi',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 19),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(68, 83, 226, 1))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
