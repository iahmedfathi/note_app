import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list.dart';

class EditColorsList extends StatefulWidget {
  const EditColorsList({super.key, required this.notes});
  final NoteModel notes;
  @override
  State<EditColorsList> createState() => _EditColorsListState();
}

class _EditColorsListState extends State<EditColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.notes.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.notes.color = kColors[index].value;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ItemColors(
                  color: kColors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
