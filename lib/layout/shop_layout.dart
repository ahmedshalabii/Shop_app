import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import 'cubit/cubit.dart';

class ShopLayout extends StatefulWidget {
  ShopLayout();

  @override
  _ShopLayoutState createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);

        return Scaffold(
          //  backgroundColor:HexColor('f1faee'),
          appBar: AppBar(
            title: Text(
              'E - Shop',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 27.0,
                  color: HexColor('e63946')),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: HexColor('ff9f1c'),
                  size: 30.0,
                ),
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomNavigationBar(
                  elevation: 50,
                  onTap: (index) {
                    cubit.changeBottom(index);
                  },
                  currentIndex: cubit.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 33,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 33,
                      ),
                      label: 'Carts',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(

                        Icons.favorite,
                        size: 33,
                      ),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        size: 33,
                      ),
                      label: 'Settings',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
