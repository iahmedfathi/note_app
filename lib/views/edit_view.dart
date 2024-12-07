import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/edit_colors_list.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.notes});
  final NoteModel notes;
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBarBody(
                  title: "Edit Note",
                  icon: Icons.check,
                  onPressed: () {
                    widget.notes.title = title ?? widget.notes.title;
                    widget.notes.subTitle = content ?? widget.notes.subTitle;
                    widget.notes.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                hintText: widget.notes.title,
                maxLines: 1,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                hintText: widget.notes.subTitle,
                maxLines: 8,
                onChanged: (value) {
                  content = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              EditColorsList(notes: widget.notes),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
