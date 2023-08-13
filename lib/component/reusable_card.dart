import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final void Function() onPressed;
  const ReusableCard(
      {super.key,
      required this.colour,
      required this.cardChild,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
