import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ListOfItemColors extends StatefulWidget {
  const ListOfItemColors({super.key});

  @override
  State<ListOfItemColors> createState() => _ListOfItemColorsState();
}

class _ListOfItemColorsState extends State<ListOfItemColors> {
  bool? isActive;
  int currentIndex = 0;

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
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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

class ItemColors extends StatelessWidget {
  const ItemColors({super.key, this.isActive = true, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}
