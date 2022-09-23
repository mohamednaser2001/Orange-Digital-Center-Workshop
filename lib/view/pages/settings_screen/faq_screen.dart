import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';


class FAQScreen extends StatelessWidget {

  late ExpandedTileController _controller = ExpandedTileController(isExpanded:true);




  @override
  Widget build(BuildContext context) {


    return ConditionalBuilder(
      condition: AppCubit.get(context).faqModel !=null,
      builder:(context)=> ConditionalBuilder(
        condition: AppCubit.get(context).faqModel!.data!.length >0,
        builder: (context){
          String htmlContentQuestion = """${AppCubit.get(context).faqModel!.data![0].question}""";
          String htmlContentAnswer = """${AppCubit.get(context).faqModel!.data![0].answer}""";

          final TextSpan textSpanQuestion = HTML.toTextSpan(
            context,
            htmlContentQuestion,
            linksCallback: (dynamic link) {
              debugPrint('You clicked on ${link.toString()}');
            },
            defaultTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15.3,
              fontWeight: FontWeight.w500,
            ),
            overrideStyle: <String, TextStyle>{
              'p': const TextStyle(fontSize: 16.3,),
              'a': const TextStyle(wordSpacing: 2),
            },
          );

          final TextSpan textSpanAnswer = HTML.toTextSpan(
            context,
            htmlContentAnswer,
            linksCallback: (dynamic link) {
              debugPrint('You clicked on ${link.toString()}');
            },
            defaultTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15.3,
              fontWeight: FontWeight.w500,
            ),
            overrideStyle: <String, TextStyle>{
              'p': const TextStyle(fontSize: 16.3,),
              'a': const TextStyle(wordSpacing: 2),
            },
          );

          return ListView.separated(
            itemBuilder:(context, index)=>Container(
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ExpandedTile(
                contentSeperator: 0.0,
                trailing:const Icon(Icons.arrow_back_ios_new, size: 15, color: Colors.black,),
                theme: const ExpandedTileThemeData(
                  headerColor: Colors.deepOrange,
                  headerRadius: 0.0,
                  headerPadding: EdgeInsets.all(8.0),
                  headerSplashColor: Colors.white,
                  contentBackgroundColor: Colors.grey,
                  contentPadding: EdgeInsets.all(20.0),
                  contentRadius: 0.0,
                ),
                controller: _controller,
                title: RichText(
                  text: textSpanQuestion,
                  textAlign: TextAlign.center,
                ),
                content: RichText(
                  text: textSpanAnswer,
                  textAlign: TextAlign.center,
                ),

              ),
            ),
            separatorBuilder:(context, index)=> const SizedBox(height: 20.0,),
            itemCount: AppCubit.get(context).faqModel!.data!.length,
          );
        },
        fallback:(context)=> emptyScreen(text: 'No FAQ Yet'),
      ),
      fallback:(context)=>const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
    );
  }
}