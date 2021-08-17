import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;

        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        passwordController.text = model.data.password;
        return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: ShopCubit.get(context).userModel != null,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state is ShopLoadingUpdateUserState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        context: context,
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'name must not be empty';
                          }

                          return null;
                        },
                        label: 'Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        context: context,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'email must not be empty';
                          }

                          return null;
                        },
                        label: 'Email Address',
                        prefix: Icons.email,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                       context: context,
                          type: TextInputType.visiblePassword,
                        controller: passwordController,
                       suffix: ShopCubit.get(context).suffix,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'password must not be empty';
                          }

                          return null;
                        },
                        isPassword: ShopCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopCubit.get(context)
                                .changePasswordVisibility();
                          },
                        label: 'Password',
                        prefix: Icons.lock,
                      ),
                   
                       SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        context: context,
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'phone must not be empty';
                          }

                          return null;
                        },
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                         SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        function: () {
                          if (formKey.currentState.validate()) {
                            ShopCubit.get(context).updateUserData(
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                            );
                          }
                        },
                        text: 'change',
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ));
      },
    );
  }
}
