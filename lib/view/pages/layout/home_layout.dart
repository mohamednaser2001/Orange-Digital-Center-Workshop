
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/states.dart';



class HomeLayout  extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        AppCubit cubit =AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(
              cubit.titles[cubit.currentIndex],
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: GNav(
              backgroundColor: Colors.white,
              tabs: cubit.bottomNavBarItems,
              tabBorderRadius: 20,
              duration:const Duration(milliseconds: 5),
              gap: 8,
              color: Colors.grey[700],
              activeColor: Colors.deepOrange,
              iconSize: 24,
              tabBackgroundColor: Colors.grey.withOpacity(0.1),
              onTabChange: (index){
                cubit.changeBottomNavBarIndex(index);
              },
              textStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,

              ),
              tabMargin: EdgeInsets.all(10),
              padding:const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            ),
          ),
        );
      },
    );
  }
}
