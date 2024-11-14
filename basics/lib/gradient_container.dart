import 'package:basics/text_cust.dart';
import 'package:basics/text_field_cust.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  //const GradientContainer({key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //gradient: const LinearGradient(colors: [Colors.deepPurple,Colors.deepOrangeAccent],),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 45, 7, 98),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        //color: Colors.blue, // Couleur de fond
        borderRadius: BorderRadius.circular(10), // Bordures arrondies
        border: Border.all(
          color: Colors.black,
          width: 2, // Épaisseur de la bordure
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Position de l'ombre
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [TextFieldCust(), TextCust()],
      ),
    );
  }
}
