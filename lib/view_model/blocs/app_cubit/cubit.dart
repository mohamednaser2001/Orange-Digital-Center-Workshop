

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange_workshop/model/exams_model.dart';
import 'package:orange_workshop/model/faq_model.dart';
import 'package:orange_workshop/model/grades_model.dart';
import 'package:orange_workshop/model/lecture_model.dart';
import 'package:orange_workshop/model/news_model.dart';
import 'package:orange_workshop/model/news_model.dart';
import 'package:orange_workshop/model/section_model.dart';
import 'package:orange_workshop/model/section_model.dart';
import 'package:orange_workshop/model/terms_model.dart';
import 'package:orange_workshop/model/university_model.dart';
import 'package:orange_workshop/model/user_model.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/pages/home_screen/home_screen.dart';
import 'package:orange_workshop/view/pages/news_screen/news_screen.dart';
import 'package:orange_workshop/view/pages/settings_screen/settings_screen.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/states.dart';
import 'package:orange_workshop/view_model/network/remote/dio_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../core/resources/constants.dart';



class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);


  List<Widget> screens=[
    HomeScreens(),
    NewsScreens(),
    SettingsScreens(),
  ];

  List<String> titles=[
    'Home',
    'News',
    'Settings',
  ];

  int s=300;
  void change(){
    s==300 ? 600: 300;
    emit(AppGetAllUsersSuccessState());
  }


  List<GButton> bottomNavBarItems=const[
    GButton(
      icon: CupertinoIcons.house,
      text: 'Home',

    ),
    GButton(
      icon: Icons.newspaper_outlined,
      text: 'News',
    ),
    GButton(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  bool isShown = false;
  void changePassword(){
    isShown=!isShown;
    emit(ChangePasswordState());
  }



  int currentIndex=0;
  void changeBottomNavBarIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavBarIndexState());
  }


  LecturesModel ?lecturesModel;

  void getAllLectures(){
    emit(AppGetAllLecturesLoadingState());
    DioHelper.getData(
        url: lectureEndPoint,
    token: token,
    ).then((value) {
      lecturesModel = LecturesModel.fromJson(value.data);
      print(lecturesModel.toString());
      emit(AppGetAllLecturesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetAllLecturesErrorState(error.toString()));
    });
  }


  SectionModel ?sectionsModel;
  void getAllSections(){
    emit(AppGetAllSectionsLoadingState());
    DioHelper.getData(
      url: sectionEndPoint,
      token: token,
    ).then((value) {
      sectionsModel = SectionModel.fromJson(value.data);
      emit(AppGetAllSectionsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetAllSectionsErrorState(error.toString()));
    });
  }

  ExamsModel ?examsModel;
  void getAllExams(){
    emit(AppGetAllExamsLoadingState());
    DioHelper.getData(
      url: examsEndPoint,
      token: token,
    ).then((value) {
      examsModel = ExamsModel.fromJson(value.data);
      separateExams();
      emit(AppGetAllExamsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetAllExamsErrorState(error.toString()));
    });
  }

  List<ExamData> finalExams=[];
  List<ExamData> midtermExams=[];
  void separateExams(){
    examsModel!.data!.forEach((element) {
      if(element.isFinal==false) midtermExams.add(element);
      else if(element.isFinal==true) finalExams.add(element);
    });
  }



  NewsModel ?newsModel;
  void getAllNews(){
    emit(AppGetAllNewsLoadingState());
    DioHelper.getData(
      url: newsEndPoint,
      token: token,
    ).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(AppGetAllNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetAllNewsErrorState(error.toString()));
    });
  }



  TermsModel? termsAndConditions;
  void getTermsAndConditions(){
    emit(AppGetTermsAndConditionsLoadingState());
    DioHelper.getData(
      url: termsEndPoint,
    //  token: token,
    ).then((value) {
      termsAndConditions = TermsModel.fromJson(value.data);
      emit(AppGetTermsAndConditionsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetTermsAndConditionsErrorState(error.toString()));
    });
  }



  FAQModel? faqModel;
  void getFAQ(){
    emit(AppGetFAQLoadingState());
    DioHelper.getData(
      url: faqEndPoint,
      //  token: token,
    ).then((value) {
      faqModel = FAQModel.fromJson(value.data);
      emit(AppGetFAQSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetFAQErrorState(error.toString()));
    });
  }






  bool isDispose=false;
  void changeExpandedTile(){
    isDispose =!isDispose;
    emit(ChangeExpandedTileState());
  }


  late Database database;
  List<Map> newNotes =[];



  void createDatabase() async
  {
    // open the database
     database = await openDatabase(
         'notes',
         version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, time TEXT, body TEXT)');
        });
  }

  void getDataFromDatabase(lastDatabase)
  {
    newNotes=[];

    emit(AppGetDatabaseLoadingState());
    lastDatabase.rawQuery('select * from ToDo').then((value) {
      value.forEach((element){
          newNotes.add(element);
      });
      emit(AppGetDatabaseSuccessState());
    });
  }
  insetIntoDatabase({
    required String title ,
    required String note ,
    required String time}) async
  {
    await database.transaction((txn) {
      return txn.rawInsert('insert into ToDo (title,time,note) values("$title","$time","$note"')
          .then((value) {
        print('$value inserted');
        emit(AppInsertIntoDatabaseSuccessState());

        getDataFromDatabase(database);
      }).catchError((error){
        print('error when inserting record ${error.toString()}');
        emit(AppInsertIntoDatabaseErrorState());
      });
    });
  }


}

