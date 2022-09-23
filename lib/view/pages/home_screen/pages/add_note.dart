
import 'package:flutter/material.dart';
import 'package:orange_workshop/view/components/core/core_components.dart';

class AddNoteScreen extends  StatelessWidget {
   AddNoteScreen({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Add Note',
        elevation: 0.0,
        leadingIcon: Icons.arrow_back_ios_new,
        leadingFunction: (){Navigator.pop(context);},
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DefaultTextFormField(
                isNote: true,
                  text: 'Title',
                  controller: titleController,
                  validator: (value){},
                  context: context,
              ),
              const SizedBox(height: 24.0,),
              DefaultTextFormField(
                isNote: true,
                  text: 'Date',
                  controller: dateController,
                  validator: (value){},
                  context: context,
              ),
              const SizedBox(height: 24.0,),
              DefaultTextFormField(
                isNote: true,
                  text: 'Note',
                  isDescription: true,
                  controller: noteController,
                  validator: (value){},
                  context: context,
              ),
              const SizedBox(height: 34.0,),
              customButton(
                withBorder: false,
                  isMin: true,
                  text: 'Add',
                  icon: Icons.add,
                  function: (){},
                color: Colors.blueGrey.shade200,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
