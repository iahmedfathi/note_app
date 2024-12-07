

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';

import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/note_list_item.dart';

class NoteBody extends StatefulWidget {
  const NoteBody({super.key});

  @override
  State<NoteBody> createState() => _NoteBodyState();
}

class _NoteBodyState extends State<NoteBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBarBody(
            title: 'Notes',
            icon: Icons.search,
          ),
          NoteListItem()
        ],
      ),
    );
  }
}
