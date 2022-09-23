import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/model/exams_model.dart';
import 'package:orange_workshop/model/lecture_model.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/components/home.dart';

class ExamsScreen extends StatelessWidget {

  List<ExamData> examsData;
  ExamsScreen ({
    Key? key,
    required this.examsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('${examsData.length}9999999');

    return Scaffold(
      appBar: customAppBar(
        title: 'Exam',
        leadingIcon: Icons.arrow_back_ios_new,
        leadingFunction: (){
          Navigator.pop(context);
        },
        actionFunction: (){},
        actionIcon: Icons.filter_alt,
      ),
      body: ConditionalBuilder(
        condition: examsData.isNotEmpty,
        builder:(context)=> Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemBuilder:(context, index)=> timingCardItem(model: examsData[index]),
            itemCount: examsData.length,
          ),
        ),
        fallback:(context)=> Center(child: Text(
          'No Exams Yet',
          style: GoogleFonts.poppins(
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.6),
          ),
        )) ,
      ),
    );
  }
}
