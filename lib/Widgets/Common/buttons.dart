import 'package:flutter/material.dart';
import 'package:tentwenty/Theme/theme.dart';

class PrimaryElevatedButton extends StatefulWidget {
  final buttonText;
  const PrimaryElevatedButton({super.key, required this.buttonText});

  @override
  State<PrimaryElevatedButton> createState() => _PrimaryElevatedButtonState();
}

class _PrimaryElevatedButtonState extends State<PrimaryElevatedButton> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: AppTheme().secondaryColor,
      foregroundColor: Colors.white);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () {},
      child: Text(
        widget.buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SecondaryElevatedButton extends StatefulWidget {
  final buttonText;
  const SecondaryElevatedButton({super.key, required this.buttonText});

  @override
  State<SecondaryElevatedButton> createState() =>
      _SecondaryElevatedButtonState();
}

class _SecondaryElevatedButtonState extends State<SecondaryElevatedButton> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppTheme().secondaryColor,width: 1,style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10.0),
      ),
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () {},
      child: Text(
        widget.buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
