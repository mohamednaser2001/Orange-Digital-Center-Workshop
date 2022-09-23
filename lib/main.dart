import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/core/resources/themes.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/events.dart';
import 'package:orange_workshop/view/pages/settings_screen/faq_screen.dart';
import 'package:orange_workshop/view/pages/splash_screen/splash_screen.dart';
import 'package:orange_workshop/view_model/network/remote/dio_helper.dart';
import 'view/pages/home_screen/pages/notes.dart';
import 'view/pages/login/login_screen.dart';
import 'view/pages/register/register_screen.dart';
import 'view/pages/settings_screen/terms_screen.dart';
import 'view_model/blocs/app_cubit/bloc_observer.dart';
import 'view_model/blocs/app_cubit/cubit.dart';
import 'view_model/network/local/cache_helper.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  token = CacheHelper.getData(key: 'token');

  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp();
  MyAppTheme appTheme =  MyAppTheme();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getFAQ()..getAllNews()..getAllLectures()..getAllSections()..getAllExams()..getTermsAndConditions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
        themeMode: ThemeMode.light,
        home:SplashScreen(),// startWidget,
      ),
    );
  }
}

