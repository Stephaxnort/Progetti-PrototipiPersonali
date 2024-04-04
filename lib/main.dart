import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prima_app_flutter/AuthPage.dart';
import 'package:prima_app_flutter/PagineDiNav/PrimaPagina.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prima_app_flutter/auth.dart';
import 'firebase_options.dart';

// ...



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return PrimaPagina();} else{
            return AuthPage();

          }
        }

      )

    );
  }
}

