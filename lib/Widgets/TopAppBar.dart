import 'package:flutter/material.dart';
class TopAppBar extends StatelessWidget {
  final index;
  const TopAppBar({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(index==0?"Dashboard":index==1?"Watch":index==2?"Media Library":"More", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        )
      ],
      elevation: 1,shadowColor: Colors.black,
    );
  }
}
