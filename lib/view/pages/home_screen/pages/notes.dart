
import 'package:flutter/material.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';
import 'package:orange_workshop/view/pages/home_screen/pages/add_note.dart';

class NotesScreen extends  StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Notes',
        leadingIcon: Icons.arrow_back_ios_new,
        leadingFunction: (){Navigator.pop(context);},
      ),

      body: Center(child: Text('There\'s No Data To Sow')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateTo(context, AddNoteScreen());
        },
        child:const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
