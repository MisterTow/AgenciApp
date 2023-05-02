import 'dart:io';

import 'package:agencia/Registros/registroPropietario.dart';
import 'package:flutter/material.dart';
import 'package:agencia/inicio.dart';
import 'package:agencia/Registros/registroI.dart';
import 'package:agencia/Registros/registrocasas.dart';

class registrocasas extends StatefulWidget {
  registrocasas({Key? key}) : super(key: key);

  @override
  _Registrocasas createState() => _Registrocasas();
}

class _Registrocasas extends State<registrocasas> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 90.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Color.fromARGB(255, 240, 238, 238),
                backgroundImage: AssetImage('assets/images/logosinfondo.png'),
              ),
              Text(
                'una casa',
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
                  hintText: 'Nombre del propietario',
                  labelText: 'Nombre del propietario',
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
                decoration: InputDecoration(
                  hintText: 'Direccion del imueble',
                  labelText: 'Direccion del imueble',
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
                  hintText: 'Monto de renta',
                  labelText: 'Monto de renta',
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
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Formas de pagosa',
                  labelText: 'Formas de pagos',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('seleccione una imagen:'),
                    // (imagePath == null)
                    // ? Container()
                    // : Image.file(File(imagePath)),
                    //ojo importat libreria
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Cargar Imagen'),
                    )
                  ],
                ),
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
                  onPressed: () {},
                  child: Text(
                    'Registrar',
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
                          builder: (context) => RegistroPropietario())); //ojo
                },
                label: const Text(''),
                icon: const Icon(Icons.login),
              )
            ],
          ),
        ],
      ),
    );
  }
}
