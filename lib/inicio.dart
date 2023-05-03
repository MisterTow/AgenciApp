import 'package:agencia/logins/loginInquilino.dart';
import 'package:agencia/logins/loginpropietario.dart';
import 'package:agencia/splash.dart';
import 'package:flutter/material.dart';
import 'homes/home_inquilinos.dart';

// class Inicio extends StatefulWidget {
//   Inicio({Key? key}) : super(key: key);

//   @override
//   _InicioState createState() => _InicioState();
// }

class PrimeraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 8,
              shape: CircleBorder(),
              minimumSize: Size.square(170),
              textStyle: TextStyle(fontSize: 28),
              primary: Color.fromARGB(74, 96, 110, 255)),
          child: Text(
            "Propietario",
            style: const TextStyle(color: Colors.blue),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPropietario()));
          },
        ),
        Divider(
          height: 200,
          thickness: 5,
          color: Color.fromARGB(255, 217, 218, 219),
          indent: 20,
          endIndent: 40,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 8,
              shape: CircleBorder(),
              minimumSize: Size.square(170),
              textStyle: TextStyle(fontSize: 26),
              primary: Color.fromARGB(74, 96, 110, 255)),
          child: Text(
            "Arrendatario",
            style: const TextStyle(color: Colors.blue),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginInquilino()));
          },
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Splash()));
          },
          label: const Text(''),
          icon: const Icon(Icons.login),
        ),
      ],
    ));
  }
}
