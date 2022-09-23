import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/components/home.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/events.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/exams_screen.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/lectures_screen.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/notes.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/sections_screen.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';

class HomeScreens extends  StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> homeCards=[
      homeScreenCard(
        title: 'Lectures',
        iconRoute: 'lecture',
        function: (){
          navigateTo(
            context,
            LecturesScreen(model:AppCubit.get(context).lecturesModel!),
          );
        },
      ),

      homeScreenCard(
        title: 'Sections',
        iconRoute: 'sections',
        function: (){
          navigateTo(
            context,
            SectionsScreen(model:AppCubit.get(context).sectionsModel!),
          );
        },
      ),

      homeScreenCard(
        title: 'Midterm',
        iconRoute: 'midterm',
        function: (){
          navigateTo(
            context,
            ExamsScreen(examsData:AppCubit.get(context).midtermExams),
          );
        },
      ),

      homeScreenCard(
        title: 'Finals',
        iconRoute: 'final',
        function: (){
          navigateTo(
            context,
            ExamsScreen(examsData:AppCubit.get(context).finalExams),
          );
        },
      ),

      homeScreenCard(
        title: 'Events',
        iconRoute: 'event',
        function: (){
          navigateTo(
            context,
            EventScreen(),
          );
        },
      ),

      homeScreenCard(
        title: 'Notes',
        iconRoute: 'notes',
        function: (){
          navigateTo(
            context,
            NotesScreen(),
          );
        },
      ),

    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
            crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.1/1,
          children: List.generate(homeCards.length,
                  (index) => homeCards[index],
          ),
        ),
      ),
    );
  }



}
