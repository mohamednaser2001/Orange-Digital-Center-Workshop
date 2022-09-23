



import 'package:orange_workshop/model/user_model.dart';

abstract class OrangeAppLoginStates{}
 class OrangeAppLoginInitialState extends OrangeAppLoginStates{}
 class OrangeAppLoginSuccessState extends OrangeAppLoginStates{
  UserModel userModel;
  OrangeAppLoginSuccessState(this.userModel);
 }
 class OrangeAppLoginErrorState extends OrangeAppLoginStates{
  String error;
  OrangeAppLoginErrorState({required this.error});
}
 class OrangeAppLoginLoadingState extends OrangeAppLoginStates{}
 class OrangeAppLoginChangeState extends OrangeAppLoginStates{}