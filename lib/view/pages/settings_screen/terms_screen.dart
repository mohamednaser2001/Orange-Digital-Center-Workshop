import 'package:flutter/material.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     String htmlContent = """${AppCubit.get(context).termsAndConditions!.data!.terms}""";

    final TextSpan textSpan = HTML.toTextSpan(
      context,
      htmlContent,
      linksCallback: (dynamic link) {
        debugPrint('You clicked on ${link.toString()}');
      },
      defaultTextStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
        fontSize: 16.3,
        fontWeight: FontWeight.w600,
      ),
      overrideStyle: <String, TextStyle>{
        'p': const TextStyle(fontSize: 16.3,),
        'a': const TextStyle(wordSpacing: 2),
      },

    );

    return SingleChildScrollView(
      child: RichText(
        text: textSpan,
        textAlign: TextAlign.center,
      ),
    );
  }
}