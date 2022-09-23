
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget dropDownItem({
  required List<String>values,
  required String header,
})=>Column(
  children: [
    Text(
      header,
      style: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.black
      ),
    ),
    const SizedBox(height: 8.0,),
    Container(
      padding:const EdgeInsets.symmetric(horizontal: 8.0,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.orange,width: 2.0),
      ),
      child: DropdownButton(

        underline:const SizedBox(),
        value: values[0],
        borderRadius: BorderRadius.circular(12.0),
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),
        items: values.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (newValue) {},
      ),
    ),
  ],
);