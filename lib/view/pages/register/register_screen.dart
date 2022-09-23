
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/view/pages/login/login_screen.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/states.dart';
import 'package:orange_workshop/view_model/blocs/register/register_cubit.dart';
import 'package:orange_workshop/view_model/blocs/register/register_states.dart';
import 'package:orange_workshop/view_model/network/local/cache_helper.dart';

import '../../components/authentication.dart';
import '../../components/core/core_components.dart';
import '../../components/register.dart';




class RegisterScreen extends  StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var titleController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> OrangeAppRegisterCubit()..getUniversities()..getGrades(),
      child: BlocConsumer<OrangeAppRegisterCubit,OrangeAppRegisterStates>(
        listener: (context,state){
          if(state is OrangeAppRegisterSuccessState){
              Navigator.pop(context);
          }
        },
        builder: (context,state){
          OrangeAppRegisterCubit cubit =OrangeAppRegisterCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          orangeHeader(),
                          const SizedBox(height: 40.0,),
                          Row(
                            children: [
                              loginAndRegisterHeader(text: 'Sign Up'),
                            ],
                          ),

                          const SizedBox(height: 30.0,),
                          DefaultTextFormField(
                            context: context,
                            controller: nameController,
                            validator: (value){},
                            text: 'Name',
                            withBorder: true,
                            isPassword: false,
                          ),
                          const SizedBox(height: 20.0,),
                          DefaultTextFormField(
                            context: context,
                            controller: emailController,
                            validator: (value){},
                            text: 'E-Mail',
                            withBorder: true,
                            isPassword: false,
                          ),
                          const SizedBox(height: 20.0,),
                          DefaultTextFormField(
                            context: context,
                            controller: phoneController,
                            validator: (value){},
                            text: 'Phone',
                            withBorder: true,
                            isPassword: false,
                          ),
                          const SizedBox(height: 20.0,),
                          BlocConsumer<AppCubit, AppStates>(
                            listener: (context, state){},
                            builder: (context, state){
                              return DefaultTextFormField(
                                context: context,
                                controller: passwordController,
                                suffixIconPressed: (){
                                  AppCubit.get(context).changePassword();
                                },
                                validator: (value){},
                                text: 'Password',
                                withBorder: true,
                                isPassword: true,
                                isSecured: AppCubit.get(context).isShown,
                              );
                            },
                          ),

                          const SizedBox(height: 20.0,),
                          BlocConsumer<AppCubit, AppStates>(
                            listener: (context, state){},
                            builder: (context, state){
                              return DefaultTextFormField(
                                context: context,
                                controller: confirmPasswordController,
                                suffixIconPressed: (){
                                  AppCubit.get(context).changePassword();
                                },
                                validator: (value){},
                                text: 'Confirm Password',
                                withBorder: true,
                                isPassword: true,
                                isSecured: AppCubit.get(context).isShown,
                              );
                            },
                          ),
                          const SizedBox(height: 20.0,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dropDownItem(header: 'Gender', values: cubit.genderValues),
                              dropDownItem(header: 'University', values: cubit.universitiesValues),
                            ],
                          ),

                          const SizedBox(height: 20.0,),
                          dropDownItem(header: 'Grade', values: cubit.gradesValues),
                          const SizedBox(height: 30.0,),

                          if(state is OrangeAppRegisterLoadingState)
                            LinearProgressIndicator(color: Colors.deepOrange,),
                          customButton(
                              text: 'Sign Up',
                              function: (){
                                cubit.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    title: titleController.text);
                              },
                          ),

                          authenticationScreenDivider(),
                          customButton(
                            text: 'Login',
                            function: (){
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                            textColor: Colors.deepOrange,
                          ),

                          const SizedBox(height: 60.0,),
                        ],
                      ),
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
