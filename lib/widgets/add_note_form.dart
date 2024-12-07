import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  int color=const Color(0xff21295C).value;
  

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            onSaved: (value) {
              title = value;
            },
            maxLines: 1,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              subTitle = value;
            },
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 5,
            hintText: 'Content',
          ),
          const SizedBox(
            height: 32,
          ),
          const ListOfItemColors(),
          const SizedBox(
            height: 32,
          ),
          BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    

                    DateTime now = DateTime.now();
                    String formattedDate =
                        DateFormat('yyyy-MM-dd / kk:mm').format(now);
                    NoteModel noteModel = NoteModel(
                        date: formattedDate,
                        title: title!,
                        subTitle: subTitle!,
                        color:color);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
