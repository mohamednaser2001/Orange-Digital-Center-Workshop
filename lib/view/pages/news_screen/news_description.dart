
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/model/news_model.dart';

class NewsDescription  extends StatelessWidget {
   NewsDescription({Key? key, required this.newsData}) : super(key: key);

  NewsData newsData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(newsData.imageUrl!,fit: BoxFit.cover,),
                   InkWell(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Card(
                         color: Colors.white,
                         elevation: 5.0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(24.0),
                         ),
                        child:const Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange,),
                        ),
                  ),
                     ),
                   ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsData.title!,
                      style: GoogleFonts.poppins(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    Text(
                      newsData.date!,
                      style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        newsData.body!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
