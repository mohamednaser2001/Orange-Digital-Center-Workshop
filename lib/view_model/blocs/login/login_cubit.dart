


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/model/user_model.dart';
import 'package:orange_workshop/view_model/network/local/cache_helper.dart';
import 'package:orange_workshop/view_model/network/remote/dio_helper.dart';


import 'login_states.dart';

class OrangeAppLoginCubit extends Cubit <OrangeAppLoginStates>{
  OrangeAppLoginCubit():super(OrangeAppLoginInitialState());


  static OrangeAppLoginCubit get(context)=> BlocProvider.of(context);


  void userLogin({
  required String email,
  required String password,
  }){
    emit(OrangeAppLoginLoadingState());
    DioHelper.postData(
        url: loginEndPoint,
        data: {
          'email':email,
          'password':password,
        }).then((value) {

          emit(OrangeAppLoginSuccessState(UserModel.fromJson(value.data)));
    }).catchError((error){
      print(error.toString());
      emit(OrangeAppLoginErrorState(error: error.toString()));
    });

  }


  bool isShown = false;
  void changePassword(){
    isShown=!isShown;
    emit(OrangeAppLoginChangeState());
  }

}