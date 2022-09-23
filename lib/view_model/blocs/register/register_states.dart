





import 'package:orange_workshop/model/user_model.dart';

abstract class OrangeAppRegisterStates{}
class OrangeAppRegisterInitialState extends OrangeAppRegisterStates{}
class OrangeAppRegisterSuccessState extends OrangeAppRegisterStates{

}
class OrangeAppRegisterErrorState extends OrangeAppRegisterStates{
  String error;
  OrangeAppRegisterErrorState({required this.error});
}

class OrangeAppRegisterLoadingState extends OrangeAppRegisterStates{}
class OrangeAppRegisterChangeState extends OrangeAppRegisterStates{}


class OrangeAppCreateUserSuccessState extends OrangeAppRegisterStates{
UserModel model;
OrangeAppCreateUserSuccessState(this.model);
}
class OrangeAppCreateUserErrorState extends OrangeAppRegisterStates{
  String error;
  OrangeAppCreateUserErrorState(this.error);
}


// get universities states
class RegisterGetUniversitiesLoadingState extends OrangeAppRegisterStates{}
class RegisterGetUniversitiesSuccessState extends OrangeAppRegisterStates{}
class RegisterGetUniversitiesErrorState extends OrangeAppRegisterStates{
  String error;
  RegisterGetUniversitiesErrorState(this.error);
}


// get grades states
class RegisterGetGradesLoadingState extends OrangeAppRegisterStates{}
class RegisterGetGradesSuccessState extends OrangeAppRegisterStates{}
class RegisterGetGradesErrorState extends OrangeAppRegisterStates{
  String error;
  RegisterGetGradesErrorState(this.error);
}

