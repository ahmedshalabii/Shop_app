import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/modules/profile_screen/profile_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/styles/colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: () {
                    navigateTo(context, ProfileScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.blueAccent)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 35,
                            color: defaultColor,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Profile Settings",
                            style: TextStyle(fontSize: 20, color: defaultColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.brightness_2_sharp,
                        color:AppCubit.get(context).isDark ?Colors.white:HexColor('242526'),
                        size: 50.0,
                      ),
                      onPressed: () {
                        setState(() {
                                                  
                                               
                        AppCubit.get(context).changeAppMode();
                         });
                      },
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: defaultColor,
                          size: 50.0,
                        ),
                        onPressed: () {
                          ShopCubit.get(context).currentIndex = 0;
                          signOut(context);
                        }),
                  ],
                )
              ]),
        );
      },
    );
  }
}
