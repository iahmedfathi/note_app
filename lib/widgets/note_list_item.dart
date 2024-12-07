import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_item_body.dart';
import 'package:flutter/material.dart';

class NoteListItem extends StatelessWidget {
  const  NoteListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              itemCount: notes.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return  NoteItemBody(note: notes[index],);
              },
            ),
          ),
        );
      },
    );
  }
}
