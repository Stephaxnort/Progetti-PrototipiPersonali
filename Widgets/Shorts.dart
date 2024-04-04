import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@override
ThemeData build(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.yellow, // Colore primario
        accentColor: Colors.red,
        brightness: Brightness.dark,// Colore secondario
        // Altri colori possono essere specificati qui
      ),
      // Altre proprietà del tema
    );
  }


