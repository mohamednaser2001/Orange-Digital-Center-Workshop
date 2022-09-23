import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/components/settings.dart';
import 'package:orange_workshop/view/pages/login/login_screen.dart';
import 'package:orange_workshop/view/pages/settings_screen/faq_screen.dart';
import 'package:orange_workshop/view/pages/settings_screen/terms_screen.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:orange_workshop/view_model/network/local/cache_helper.dart';
import 'package:orange_workshop/view_model/network/remote/dio_helper.dart';

class SettingsScreens extends  StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          settingItem(text: 'FAQ', function: (){
            navigateTo(context, DefaultScreen(screenBody: FAQScreen(), appBarTitle: 'FAQ'));
          }),
          line(),
          settingItem(text: 'Terms & conditions', function: (){
            navigateTo(context, DefaultScreen(screenBody: TermsAndConditionsScreen(), appBarTitle: 'Terms & conditions'));
          }),
          line(),
          settingItem(text: 'Our partners', function: (){
            navigateTo(context, DefaultScreen(screenBody: partnersScreenBody(), appBarTitle: 'Our partners'));
          }),
          line(),
          settingItem(text: 'Support', function: (){
            navigateTo(context, DefaultScreen(screenBody: supportScreenBody(context), appBarTitle: 'Support'));
          }),
          line(),
          settingItem(text: 'Log out', function: (){
            showAlertDialog(
                context: context,
              function: (){
                  CacheHelper.removeData(key: 'token');
                  navigateWithoutBack(context, LoginScreen());
              },
              text: 'Logout',
            );
          }),
        ],
      ),
    );
  }



}
