import 'package:flutter/material.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:Container(

  child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/empty_cart.png')),
                        Text(
                          'Your cart is empty, browse more!',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ]),
                ),
)
    );
  }
}



