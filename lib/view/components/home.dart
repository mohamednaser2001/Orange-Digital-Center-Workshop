

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/model/exams_model.dart';
import 'package:orange_workshop/model/lecture_model.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';

Widget timingCardItem({required dynamic model})=>Card(
  elevation: 4.0,
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  margin:const EdgeInsets.symmetric(vertical: 16.0),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              model.subject!,
              style: GoogleFonts.roboto(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            const Spacer(),
            Icon(Icons.timer,color: Colors.black.withOpacity(0.6),size: 18.0,),
            Text(
              '2hrs',
              style: GoogleFonts.roboto(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
        Row(
          children: [
            listTileOfTimingCardItem(title: 'Section Day',icon: Icons.calendar_month, subTitle: model.date!,iconColor: Colors.black.withOpacity(0.7)),
            listTileOfTimingCardItem(title: 'Start Time',icon: Icons.access_time_filled, subTitle: model.startTime!.substring(0, 5),iconColor: Colors.green.shade300),
            listTileOfTimingCardItem(title: 'End Time',icon: Icons.access_time_filled, subTitle: model.endTime!.substring(0, 5),iconColor: Colors.pink.shade300),
          ],
        ),
      ],
    ),
  ),
);



Widget listTileOfTimingCardItem({
  required String title,
  required String subTitle,
  Color ? iconColor,
  required IconData icon,
})=>Expanded(
  child:ListTile(
    contentPadding: EdgeInsets.zero,
    title: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
    ),
    subtitle: Row(
      children: [
        Icon(icon,color:iconColor==null?Colors.black : iconColor,),
        const SizedBox(width: 2.0,),
        Text(
          subTitle,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    ),
  ),
);



Widget homeScreenCard({
  required String title,
  required String iconRoute,
  required Function function,
})=> Card(
  elevation: 4,
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  child: InkWell(
    onTap: (){
      function();
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.grey.withOpacity(0.6),
          child: SvgPicture.asset('${path}/icons/$iconRoute.svg',height: 32,width: 32,color: Colors.deepOrange,),
        ),
        const SizedBox(height: 12.0,),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            color: Colors.deepOrange,
          ),
        ),
      ],
    ),
  ),
);



