import 'package:flutter/material.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child:   Column(
            children: [
              Text("watch"),
            ],
          )
      ),
    );
  }
}
