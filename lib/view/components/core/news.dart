import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/model/news_model.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/pages/news_screen/news_description.dart';

Widget newsCard({required NewsData model, required Function function})=>SizedBox(
  width: double.infinity,
  height: 220,
  child: GestureDetector(
    onTap: (){
      function();
    },
    child: Card(
      color: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3.0,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Image.asset('lib/core/resources/assets/images/logo.png',
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'ODCs',
                      style: GoogleFonts.roboto(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Card(
                      elevation: 0.0,
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.share,color: Colors.white.withOpacity(0.7),),
                            Text(
                              ' | ',
                              style: GoogleFonts.roboto(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            Icon(Icons.copy_all,color: Colors.white.withOpacity(0.7),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  model.body!,
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          // orangeHeader(isCard: true),
        ],
      ),
    ),
  ),
);