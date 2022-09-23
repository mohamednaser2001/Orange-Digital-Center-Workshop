import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/pages/layout/home_layout.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/states.dart';
import 'package:orange_workshop/view_model/network/local/cache_helper.dart';

import '../../components/authentication.dart';
import '../register/register_screen.dart';
import '../../../view_model/blocs/login/login_cubit.dart';
import '../../../view_model/blocs/login/login_states.dart';

class LoginScreen extends  StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>OrangeAppLoginCubit(),
      child: BlocConsumer<OrangeAppLoginCubit,OrangeAppLoginStates>(
        listener: (context, state){
          if(state is OrangeAppLoginSuccessState){
              CacheHelper.saveData(key: 'token',value:  state.userModel.data!.accessToken);
              navigateWithoutBack(context,const HomeLayout());
              showToast(text: state.userModel.message, state: ToastStates.SUCCESS);
          }

        },
        builder: (context, state){
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orangeHeader(),
                         const SizedBox(height: 110.0,),
                        loginAndRegisterHeader(text: 'Login'),
                        const SizedBox(height: 30.0,),
                        DefaultTextFormField(
                          context: context,
                          controller: emailController,
                          validator: (value){
                            if(value!.isEmpty) return 'Enter your email';
                            return null;
                          },
                          text: 'E-Mail',
                          withBorder: true,
                          isPassword: false,
                        ),

                        const SizedBox(height: 25.0,),
                        BlocConsumer<AppCubit, AppStates>(
                          listener: (context, state){},
                          builder: (context, state){
                            return DefaultTextFormField(
                              context: context,
                              controller: passwordController,
                              suffixIconPressed: (){
                                AppCubit.get(context).changePassword();
                              },
                              validator: (value){
                                if(value!.isEmpty) return 'Enter your password';
                                return null;
                              },
                              text: 'Password',
                              withBorder: true,
                              isPassword: true,
                              isSecured: AppCubit.get(context).isShown,
                            );
                          },
                        ),

                        customTextButton(text: 'Forgot Password?'),

                        const SizedBox(height: 30.0,),

                        if(state is OrangeAppLoginLoadingState)
                          LinearProgressIndicator(color: Colors.deepOrange,),
                        customButton(
                          text: 'Login',
                          function: (){
                            if(formKey.currentState!.validate()){
                              OrangeAppLoginCubit.get(context).userLogin(
                                  email:emailController.text ,
                                  password: passwordController.text,
                              );
                            }
                            else {
                              print(emailController.text);
                              print(passwordController.text);
                            }
                          } ,
                        ),

                        authenticationScreenDivider(),

                        customButton(
                          text: 'Sign Up',
                          color: Colors.white,
                          textColor: Colors.deepOrange,
                          function: (){
                            navigateTo(context, RegisterScreen());
                          },
                        ),

                        const SizedBox(height: 30.0,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
