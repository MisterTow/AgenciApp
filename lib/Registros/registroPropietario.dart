import 'package:agencia/Registros/registrocasas.dart';
import 'package:agencia/homes/home_inquilinos.dart';
import 'package:agencia/Registros/registroPropietario.dart';
import 'package:agencia/homes/home_propietario.dart';
import 'package:agencia/logins/loginpropietario.dart';
import 'package:flutter/material.dart';
import 'registroPropietario.dart';
import 'package:agencia/inicio.dart';

class RegistroPropietario extends StatefulWidget {
  RegistroPropietario({Key? key}) : super(key: key);

  @override
  _RegistroPropietario createState() => _RegistroPropietario();
}

class _RegistroPropietario extends State<RegistroPropietario> {
  String _nombre = "";
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 90.0,
        ),
        children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 100.0,
              backgroundColor: Color.fromARGB(255, 240, 238, 238),
              backgroundImage: AssetImage('assets/images/logosinfondo.png'),
            ),
            Text(
              'Registrate como propietario',
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 50.0),
            ),
            SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(
                  color: Colors.blueGrey[600],
                )),
            Divider(
              height: 18.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo Electronico',
                labelText: 'Correo Electronico',
                suffix: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              onSubmitted: (valor) {
                _email = valor;
                print('El email es $_email');
              },
            ),
            Divider(
              height: 15.0,
            ),
            TextField(
              enableInteractiveSelection: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contrasena',
                labelText: 'Contrasena',
                suffix: Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              onSubmitted: (valor) {
                _password = valor;
                print('El password  es $_password');
              },
            ),
            Divider(
              height: 15.0,
            ),
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue, // your color here
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(50)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePropietario()));
                },
                child: Text(
                  'Registrase',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'NerkoOne'),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.square(50),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPropietario(),
                    ));
              },
              label: const Text(''),
              icon: const Icon(Icons.login),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.focused))
                    return Colors.red; // Defer to the widget's default.
                }),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => registrocasas(),
                    ));
              },
              child: Text('Registra una casa como propietario'), //
            )
          ])
        ],
      ),
    );
  }
}
