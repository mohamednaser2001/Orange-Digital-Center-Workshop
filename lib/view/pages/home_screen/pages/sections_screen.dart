import 'package:flutter/material.dart';
import 'package:orange_workshop/model/lecture_model.dart';
import 'package:orange_workshop/model/section_model.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/components/home.dart';

class SectionsScreen extends StatelessWidget {

  SectionModel model;
  SectionsScreen ({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(
        title: 'Sections',
        leadingIcon: Icons.arrow_back_ios_new,
        leadingFunction: (){
          Navigator.pop(context);
        },
        actionFunction: (){},
        actionIcon: Icons.filter_alt,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemBuilder:(context, index)=> timingCardItem(model: model.data![index]),
          itemCount: model.data!.length,
        ),
      ),
    );
  }
}
