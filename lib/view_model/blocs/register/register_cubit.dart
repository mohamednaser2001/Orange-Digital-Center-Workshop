
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/model/grades_model.dart';
import 'package:orange_workshop/model/university_model.dart';
import 'package:orange_workshop/model/user_model.dart';
import 'package:orange_workshop/view_model/blocs/register/register_states.dart';
import 'package:orange_workshop/view_model/network/remote/dio_helper.dart';






class OrangeAppRegisterCubit extends Cubit <OrangeAppRegisterStates>{
  OrangeAppRegisterCubit():super(OrangeAppRegisterInitialState());


  static OrangeAppRegisterCubit get(context)=> BlocProvider.of(context);

  List<String> genderValues=['Male','Female'];
  List<String> universitiesValues=['AUC','GUC','Cairo','Alex','ElSorouk','Banha'];
  List<String> gradesValues=['Grade1','Grade2','Grade3','Grade4','A+','Good'];


  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String title,
  }){
    emit(OrangeAppRegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      'email':email,
      'password':password,
      'phoneNumber':phone,
      'name':name,
      'gender':'m',
      'universityId':1,
      'gradeId':4,
      'roleId':2,
    }).then((value) {

      emit(OrangeAppRegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(OrangeAppRegisterErrorState(error: error.toString()));
    });
  }


  UniversitiesModel ?universitiesModel;
  void getUniversities(){
    emit(RegisterGetUniversitiesLoadingState());
    DioHelper.getData(url: universityEndPoint,).then((value){

      universitiesModel=UniversitiesModel.fromJson(value.data);
      addUniversitiesToList();
      emit(RegisterGetUniversitiesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RegisterGetUniversitiesErrorState(error.toString()));
    });
  }


  GradesModel ?gradesModel;
  void getGrades(){
    emit(RegisterGetGradesLoadingState());
    DioHelper.getData(url: gradeEndPoint,).then((value){

      gradesModel= GradesModel.fromJson(value.data);
      addGradesToList();
      emit(RegisterGetGradesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RegisterGetGradesErrorState(error.toString()));
    });
  }


  List<String> universities=[];
  void addUniversitiesToList(){
    universitiesModel!.data!.forEach((element) {
      universities.add(element.name!);
    });
  }

  List<String> grades=[];
  void addGradesToList(){
    gradesModel!.data!.forEach((element) {
      grades.add(element.grade!);
    });
  }


/*
  bool isShown = false;
  void changePassword(){
    isShown=!isShown;
    emit(OrangeAppRegisterChangeState());
  }
*/
}