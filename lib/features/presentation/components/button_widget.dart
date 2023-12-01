import 'package:flutter/material.dart';

class ButtonWiget extends StatelessWidget {
  ButtonWiget({
    super.key,
    required this.icons,
    required this.onTap,
  });
  final IconData icons;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: const Color(0xff5C5B5B),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icons,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
