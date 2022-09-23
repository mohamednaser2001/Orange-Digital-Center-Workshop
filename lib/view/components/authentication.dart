

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core_components.dart';

Widget loginAndRegisterHeader({required String text})=>Text(
  text,
  style: GoogleFonts.poppins(
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
      color: Colors.black
  ),
);

Widget authenticationScreenDivider()=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(child: line()),
      const Text(
        'OR',
        style: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
      Expanded(child: line()),
    ],
  ),
);