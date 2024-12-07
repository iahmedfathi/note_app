import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_icon_button.dart';

class CustomAppBarBody extends StatelessWidget {
  const CustomAppBarBody({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 28),
        ),
        const Spacer(),
        CustomIconButton(
          icon: icon,
          onPressed: onPressed,
        )
      ],
    );
  }
}
