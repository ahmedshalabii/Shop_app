import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).cartModel.data.cartItems.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildListCartProduct(
                  ShopCubit.get(context)
                      .cartModel
                      .data
                      .cartItems[index]
                      .product,
                  context);
            },
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).cartModel.data.cartItems.length,
          ),
          fallback: (context) {
           
            return CartEmpty(context);

            // return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget CartEmpty(context) => Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(image: AssetImage('assets/images/nodataa.png')),
          Text(
            'We didn\'t find any Cart products!',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]),
      );
}



