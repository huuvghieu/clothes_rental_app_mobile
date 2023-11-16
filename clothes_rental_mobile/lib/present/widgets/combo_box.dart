import 'package:flutter/material.dart';

class ComboBox extends StatelessWidget {
  const ComboBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: MediaQuery.of(context).size.width-10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).primaryColor,
        image: const DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
