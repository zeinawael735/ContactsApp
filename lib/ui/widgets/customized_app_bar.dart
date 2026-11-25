import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: .start,
       crossAxisAlignment: .start,
        children: [
          Image.asset("assets/images/route_logo.png", width: 150, height: 150),

        ],
      ),
    );
  }
}
