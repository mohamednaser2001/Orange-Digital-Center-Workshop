
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/core/resources/color_manger.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/cubit.dart';
import 'package:orange_workshop/view_model/blocs/app_cubit/states.dart';
import 'package:orange_workshop/view_model/blocs/login/login_cubit.dart';

import '../../../core/resources/themes.dart';


class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.greenColor,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 22,
          ),
        ),
      ),
    );
  }
}


Widget line()=>Container(
  height: 1.0,color: Colors.grey.withOpacity(0.3),
);

Future<dynamic> navigateWithoutBack(context,Widget widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>widget),
        (route) => false
);


Future<dynamic> navigateTo(context,Widget widget)=>Navigator.push(context,
  MaterialPageRoute(builder: (context)=>widget),
);


// text form field builder
Widget DefaultTextFormField({
  required TextEditingController controller,
  required String ?validator(String ? str),
  IconData ? icon,
  String ? text,
  Color color =Colors.transparent,
  bool withBorder =true,
  bool isDescription =false,
  bool isPassword =false,
  bool isSecured =false,
  bool isNote=false,
  required context,
  Function ? suffixIconPressed,
})=>BlocConsumer<AppCubit, AppStates>(
  listener: (context, state){},
  builder: (context, state){
    return Container(
      color: color,
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines:isDescription ? 5:1,
        obscureText:isSecured ? true: false,
        decoration: InputDecoration(
          suffixIcon:isPassword ? IconButton(
            onPressed: (){
               suffixIconPressed!();
            },
            icon:  Icon(
              AppCubit.get(context).isShown ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
            ),
          ) : null,
          prefixIcon:icon==null ? null : Icon(icon),
          border: withBorder ? OutlineInputBorder(
            borderSide: BorderSide(color: isNote ? Colors.teal : Colors.deepOrange,),
            borderRadius:isNote ?const BorderRadius.only(
              topLeft: Radius.circular(26.0),
              bottomRight: Radius.circular(26.0),
            ) : BorderRadius.circular(12.0),
          ) : InputBorder.none,
          labelText: text,
        ),
      ),
    );
  },
);



Future<dynamic> showAlertDialog({context,required String text,required Function function})=> showDialog(
  context: context,
  builder: (context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18.0
          ),
          ),
          const SizedBox(height: 14.0,),
          Text(
            'Are you sure?',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.0
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: customButton(
                  text: 'Cancel',
                  color: Colors.white,
                  withBorder: true,
                  textColor: Colors.deepOrange,
                  function: (){Navigator.pop(context);}),
            ),
            const SizedBox(width: 10.0,),
            Expanded(
              child: customButton(
                  text: 'Sure',
                  function: (){function();}),
            ),
          ],
        ),
      ],
    );
  },
);



Widget orangeHeader({bool isCard = false})=>Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Orange',
      style: GoogleFonts.poppins(
          fontSize:isCard? 30:24.0,
          fontWeight: FontWeight.w600,
          color: Colors.deepOrange
      ),
    ),
    Text(
      ' Digital Center',
      style: GoogleFonts.poppins(
          fontSize:isCard? 30:24.0,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
    ),
  ],
);



class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.url,
    required this.radius,
    this.onTap,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 18,
        super(key: key);

  const Avatar.medium({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 26,
        super(key: key);

  const Avatar.large({
    Key? key,
    this.url,
    this.onTap,
  })  : radius = 60,
        super(key: key);

  final double radius;
  final String? url;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _avatar(context),
    );
  }

  Widget _avatar(BuildContext context) {
    if (url != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(url!),
        backgroundColor: Theme.of(context).cardColor,
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundImage:const AssetImage('assets/images/user.png'),
        backgroundColor: Theme.of(context).cardColor,

        /*
        backgroundColor: Theme.of(context).cardColor,
        child: Center(
          child: Text(
            '?',
            style: TextStyle(fontSize: radius),
          ),
        ),
        */
      );
    }
  }
}


Widget customTextButton({required String text})=>TextButton(
  style: ButtonStyle(foregroundColor : MaterialStateProperty.all<Color>(Colors.orange)),
  child: Text(
    text,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
    ),
  ),
  onPressed: (){},
);


Widget customButton({
  required String text,
  required Function function,
  Color color =Colors.deepOrange,
  Color textColor = Colors.white,
  bool withBorder=false,
  bool isMin=false,
  IconData? icon,
})=>MaterialButton(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(isMin ? 6.0 : 10.0),
    side:withBorder ? BorderSide(width: 2.0,color: Colors.deepOrange) : BorderSide.none,
  ),
  color: color,
  height:isMin ? 38 : 45.0,
  minWidth:isMin ? 1 : double.infinity,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      if(icon!=null)
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(icon),
        ),
      Text(
        text,
        style: GoogleFonts.roboto(
          color: textColor,
          fontSize: 17,
          fontWeight: isMin ? FontWeight.w400 : FontWeight.bold,
        ),
      ),
    ],
  ),
  onPressed: (){
  function();
  },
);


AppBar customAppBar({
  required String title,
  IconData? leadingIcon,
  IconData? actionIcon,
  Function ? leadingFunction,
  Function ? actionFunction,
  double elevation = 3.5,
})=>AppBar(
  elevation: elevation,
  backgroundColor: Colors.white,
  leading:leadingIcon==null ?null : IconButton(
    icon: Icon(leadingIcon,color: Colors.deepOrange,size: 21.0,),
    onPressed: (){
      leadingFunction!();
    },
  ),
  centerTitle: true,
  title: Text(
    title,
    style: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  actions: [
    if(actionIcon!=null)
      IconButton(
      icon: Icon(actionIcon,color: Colors.deepOrange,size: 30.0,),
      onPressed: (){
        actionFunction!();
      },
    ),
  ],
);


Widget emptyScreen({required String text})=>Center(child: Text(
  text,
  style:  GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.6),
    fontSize: 28.0,
  ),
),);


enum ToastStates{ERROR,SUCCESS,WARNING}

Color choseToastState(ToastStates state){

  Color color;
  switch(state){
    case ToastStates.SUCCESS: color=Colors.green;
    break;
    case ToastStates.ERROR: color=Colors.red;
    break;
    case ToastStates.WARNING: color=Colors.amber;
    break;
  }
  return color;
}

void showToast({
  required String? text,
  required ToastStates state,
})=> Fluttertoast.showToast(
    msg:text==null ?'Error':text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: choseToastState(state),
    textColor: Colors.white,
    fontSize: 16.0
);





