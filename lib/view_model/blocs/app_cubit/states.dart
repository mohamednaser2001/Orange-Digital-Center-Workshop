

abstract class AppStates {}
class AppInitialState extends AppStates{}
class ChangePasswordState extends AppStates{}
class AppChangeBottomNavBarIndexState extends AppStates{}
class ProfileImagePickedSuccess extends AppStates{}
class ProfileImagePickedError extends AppStates{}
class ChangeExpandedTileState extends AppStates{}

//get all lectures states
class AppGetAllLecturesLoadingState extends AppStates{}
class AppGetAllLecturesSuccessState extends AppStates{}
class AppGetAllLecturesErrorState extends AppStates{
  String error;
  AppGetAllLecturesErrorState(this.error);
}

//get all sections states
class AppGetAllSectionsLoadingState extends AppStates{}
class AppGetAllSectionsSuccessState extends AppStates{}
class AppGetAllSectionsErrorState extends AppStates{
  String error;
  AppGetAllSectionsErrorState(this.error);
}

  //get all exams states
class AppGetAllExamsLoadingState extends AppStates{}
class AppGetAllExamsSuccessState extends AppStates{}
class AppGetAllExamsErrorState extends AppStates{
  String error;
  AppGetAllExamsErrorState(this.error);
}

//get all news states
class AppGetAllNewsLoadingState extends AppStates{}
class AppGetAllNewsSuccessState extends AppStates{}
class AppGetAllNewsErrorState extends AppStates{
  String error;
  AppGetAllNewsErrorState(this.error);
}


//get terms and conditions states
class AppGetTermsAndConditionsLoadingState extends AppStates{}
class AppGetTermsAndConditionsSuccessState extends AppStates{}
class AppGetTermsAndConditionsErrorState extends AppStates{
  String error;
  AppGetTermsAndConditionsErrorState(this.error);
}

//get FAQ states
class AppGetFAQLoadingState extends AppStates{}
class AppGetFAQSuccessState extends AppStates{}
class AppGetFAQErrorState extends AppStates{
  String error;
  AppGetFAQErrorState(this.error);
}




//get data base
class AppGetDatabaseLoadingState extends AppStates{}
class AppGetDatabaseSuccessState extends AppStates{}
//create data base
class AppCreateDatabaseSuccessState extends AppStates{}
//insert into data base
class AppInsertIntoDatabaseSuccessState extends AppStates{}
class AppInsertIntoDatabaseErrorState extends AppStates{}



class AppSendMessageSuccessState extends AppStates{}
class AppGetAllMessagesSuccessState extends AppStates{}
class AppSendMessageErrorState extends AppStates{
  String error;
  AppSendMessageErrorState(this.error);
}


//get all user states
class AppGetAllUsersLoadingState extends AppStates{}
class AppGetAllUsersSuccessState extends AppStates{}
class AppGetAllUsersErrorState extends AppStates{
  String error;
  AppGetAllUsersErrorState(this.error);
}



//upload profile image states
class UploadProfileImageLoadingState extends AppStates{}
class UploadProfileImageSuccessState extends AppStates{}
class UploadProfileImageErrorState extends AppStates{
  String error;
  UploadProfileImageErrorState(this.error);
}


//update user data states
class UpdateUserDataLoadingState extends AppStates{}
class UpdateUserDataErrorState extends AppStates{
  String error;
  UpdateUserDataErrorState(this.error);
}