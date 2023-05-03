import 'package:agencia/Registros/registroI.dart';
import 'package:agencia/homes/home_inquilinos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart'; //agrergar
import 'package:flutter/material.dart';
import 'package:agencia/inicio.dart';
import 'package:agencia/logins/logininquilino.dart';

class RegistroPropietario extends StatefulWidget {
  RegistroPropietario({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

//primera parte
//agregar
class _LoginState extends State<RegistroPropietario> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  //agregar

//login function
//agregar
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "usuario no funciona") {
        print("usuario o gmail no funciona");
      }
    }
    return user;
  }
  //agregar

  String _nombre = "";
  String _email = "";
  String _password = "";

//firebase
  @override
  Widget build(BuildContext context) {
    //created de text file controller
    TextEditingController _emailController = TextEditingController(); //agregar
    TextEditingController _passwordController =
        TextEditingController(); //agregar
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                          backgroundImage:
                              AssetImage('assets/images/logosinfondo.png'),
                        ),
                        Text(
                          'Iniciar sesion como inquilino',
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
                          controller: _emailController, //agregar
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
                          controller: _passwordController, //agregar
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
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.blue, // your color here
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50)))),
                            onPressed: () async {
                              User? user = await loginUsingEmailPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  context: context); //agregar
                              print(user); //agregar
                              if (user != null) {
                                //agregar
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeInquilino())); //agregar
                                //agregar un nuevo scree profile-screen
                              }
                            },
                            child: Text(
                              'Iniciar Sesion',
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
                                    builder: (context) => PrimeraPagina()));
                          },
                          label: const Text(''),
                          icon: const Icon(Icons.login),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.lightBlue),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return Colors
                                    .red; // Defer to the widget's default.
                            }),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistroInquilino(),
                                ));
                          },
                          child: Text('No Tienes Cuenta?'), //comentario
                        )
                      ])
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );

    //login Funtion
  }
}
