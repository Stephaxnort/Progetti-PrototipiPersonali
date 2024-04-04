import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prima_app_flutter/PagineDiNav/PrimaPagina.dart';
import 'package:prima_app_flutter/PagineDiNav/SecondaPagina.dart';
import 'package:http/http.dart' as http;
import 'package:prima_app_flutter/auth.dart';

Future<void> signOut() async {
  await Auth().signOut();
}

// Prima schermata dopo il login
class PrimaPagina extends StatefulWidget {
  const PrimaPagina({Key? key}) : super(key: key);

  @override
  _PrimaPaginaState createState() => _PrimaPaginaState();
}

//Classi per animare le icone
class _PrimaPaginaState extends State<PrimaPagina> with TickerProviderStateMixin {
  late AnimationController _rotationController; //rotazione icona
  late Animation<double> _rotationAnimation;
  late AnimationController _scaleController; //ingrandire in scala l'icona
  late Animation<double> _scaleAnimation;

// dopo aver premuto l'icona
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _rotationAnimation = Tween(begin: 0.0, end: 360.0).animate(_rotationController);

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween(begin: 1.0, end: 2.5).animate(_scaleController);

    _rotationController.repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  //corpo prima schermata
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mastrodontica Pizzeria", textAlign: TextAlign.center),
          foregroundColor: Colors.blue,
          backgroundColor: Colors.brown,
          actions: [

            InkWell(
              onTap: () {
                setState(() {
                  _isPressed = !_isPressed;
                  if (_isPressed) {
                    _scaleController.forward();
                  } else {
                    _scaleController.reverse();
                  }
                });

                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => SecondaPagina(),
                  ),
                );
              },
              splashColor: Colors.yellowAccent, //far capire che stiamo premendo e non in un solo tocco
              child: Padding(
                padding: EdgeInsets.all(8.0),
                  child: RotationTransition(
                    turns: _rotationAnimation,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 50),
                      opacity: _isPressed ? 0.5 : 1.0, //Per ricordare, rendere più opaco dopo l'ultimo tocco all'icona
                      child: Icon(Icons.quick_contacts_dialer_outlined),
                    ),
                  ),
                ),
              ),

            IconButton(
                onPressed: () {
                  signOut();
                },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.focused)) {
                    return Colors.red;
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.orange;
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return null;
                }),
              ),
                icon: Icon(Icons.logout),
            ),
          ],
          elevation: 40,
          shadowColor: Colors.yellowAccent,
          toolbarHeight: 60,
          toolbarOpacity: 1,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= 1) {
                      return null; //Se abbiamo già creato 2 righe, non crearne più
                    }
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              "Pizze",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    'https://as2.ftcdn.net/jpg/00/18/66/99/220_F_18669964_Txz4BS0OErzj9v9DHM3N51d8yFVa85dR.jpg',
                                    width: 130,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pizza Infernale',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Pizza al salame piccante, impasto farina di tipo 00 con polvere di peperoncino, scaglie di peperoncino, olio al peperoncino e pepe ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // seconda pizza
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    'https://as2.ftcdn.net/jpg/00/18/66/99/220_F_18669964_Txz4BS0OErzj9v9DHM3N51d8yFVa85dR.jpg',
                                    width: 130,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Altra Pizza',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Descrizione dell\'altra pizza',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    'https://as2.ftcdn.net/jpg/00/18/66/99/220_F_18669964_Txz4BS0OErzj9v9DHM3N51d8yFVa85dR.jpg',
                                    width: 130,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Altra Pizza',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Descrizione dell\'altra pizza',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
