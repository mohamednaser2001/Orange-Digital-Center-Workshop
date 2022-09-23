
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_workshop/core/resources/constants.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';

// item of setting screen
Widget settingItem({
  required String text,
  required Function function
})=>InkWell(
  onTap: (){
    function();
  },
  child:   Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.7),size: 21.0,),
      ],
    ),
  ),
);

// screen body of FAQ screen
Widget fAQScreenBody()=> Center(child:Text('FAQ'),);


// screen body of partners screen
Widget partnersScreenBody()=> Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
      width: double.infinity,
      height: 170.0,
      child: Card(
        color: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3.0,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey.shade400,
                    Colors.white,
                    Colors.grey.shade400,
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'ODCs',
                style: GoogleFonts.roboto(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Image.asset('assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    )
);

// screen body of support screen
Widget supportScreenBody(context) {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var notesController = TextEditingController();
  return SingleChildScrollView(
    child: Column(
      children: [
        DefaultTextFormField(
          icon: Icons.person,
        text: 'Name',
        withBorder: true,
            color: Colors.grey.shade200,
            controller:nameController ,
        validator: (value){

        },
        context: context),

        const SizedBox(height: 20.0,),
        DefaultTextFormField(
            icon: Icons.email,
            text: 'Email',
            color: Colors.grey.shade200,
            withBorder: true,
            controller:emailController ,
            validator: (value){

            },
            context: context),
        const SizedBox(height: 20.0,),
        DefaultTextFormField(
            text: 'What\'s make you unhappy',
            withBorder: true,
            isDescription: true,
            controller:notesController ,
            color: Colors.grey.shade200,
            validator: (value){

            },
            context: context),
        const SizedBox(height: 50.0,),
        customButton(
            text: 'Submit',
            function: (){},
        ),
      ],
    ),
  );
}



class DefaultScreen extends StatelessWidget {
  DefaultScreen ({
    Key? key,
    required this.screenBody,
    required this.appBarTitle,
  }) : super(key: key);
  Widget screenBody;
  String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: appBarTitle,
        leadingIcon: Icons.arrow_back_ios_new,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: screenBody,
      ),
    );
  }
}
