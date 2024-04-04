import 'package:flutter/material.dart';
import 'package:prima_app_flutter/PagineDiNav/PrimaPagina.dart';
class SecondaPagina extends StatelessWidget {
  const SecondaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatti", textAlign: TextAlign.center,),
        foregroundColor: Colors.brown,
        backgroundColor: Colors.blueAccent,
        elevation: 40,
        shadowColor: Colors.blue,
        toolbarHeight: 100,
        toolbarOpacity: 1,
        titleTextStyle: TextStyle(
          /*color: Colors.purple,*/
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Social"),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Home")),
            Container(





            ),
          ],
        ),
      ),
    );
  }
}
