import 'package:flutter/material.dart';
class TopAppBar extends StatelessWidget {
  final index;
  const TopAppBar({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(index==0?"Home":index==1?"Watch":"School"),
      elevation: 1,shadowColor: Colors.black,
    );
  }
}
