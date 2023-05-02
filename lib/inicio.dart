import 'package:agencia/login.dart';
import 'package:flutter/material.dart';
import './home_inquilinos.dart';

// class Inicio extends StatefulWidget {
//   Inicio({Key? key}) : super(key: key);

//   @override
//   _InicioState createState() => _InicioState();
// }

class PrimeraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirsPage"),
        backgroundColor: Colors.green,
      ),
      body: Container(
          width: 500,
          height: 500,
          alignment: Alignment.center,
          child: ListView(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(280, 80),
                    textStyle: TextStyle(fontSize: 28),
                    primary: Colors.cyanAccent),
                child: Text("Click me"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(280, 80),
                    textStyle: TextStyle(fontSize: 28),
                    primary: Colors.cyanAccent),
                child: Text("Click me"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
          )),
    );
  }
}
