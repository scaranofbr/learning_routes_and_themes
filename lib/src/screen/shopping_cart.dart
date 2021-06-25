import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_routes_and_themes/generated/l10n.dart';
import 'package:learning_routes_and_themes/src/widget/price_row.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  static const String routeName = '/product/shopping_cart';
  String get kShoppingCartTitle => S.current.shoppingCartTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(kShoppingCartTitle),
        actions: [CloseButton()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://picsum.photos/200')),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade400)),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nutramigen 1 Lgg Polvere 400g',
                            style: TextStyle(
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontSize: 15),
                          ),
                          Expanded(child: SizedBox()),
                          Row(
                            children: [
                              SizedBox(
                                height: 45,
                                child: FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.remove),
                                  heroTag: null,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: 45,
                                child: FloatingActionButton(
                                  onPressed: () {},
                                  child: Icon(Icons.add),
                                  heroTag: null,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '€ 26,72',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontSize: 23),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
          Divider(
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: Column(
              children: [
                PriceRow(leftString: 'Subtotale', rightString: '€ 26,72'),
                SizedBox(height: 10),
                PriceRow(leftString: 'Spedizione', rightString: '€ 4,90'),
                SizedBox(height: 10),
                PriceRow(leftString: 'Totale', rightString: '€ 31,62')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 7),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Vai alla cassa',
                  style: TextStyle(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontSize: 19),
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(68, 83, 226, 1))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
