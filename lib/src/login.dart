import 'package:flutter/material.dart';
import 'package:prueba/src/index.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 15.0,
            ),
            Form(
              child: _passwordTextFiel(),
              key: _formKeyPassword,
            ),
            Form(child: _userTextFiel(), key: _formKeyEmail),
            SizedBox(
              height: 20.0,
            ),
            _bottonLogin(),
          ]),
        ),
      ),
    );
  }

  Widget _userTextFiel() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          //key: _formKeyEmail,
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 5) {
              return 'Este campo es requerido';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,

          decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'tuEmail@correo.com',
              labelText: 'Correo electronico'),
        ),
      );
    });
  }

  Widget _passwordTextFiel() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          //key: _formKeyPassword,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es requerido';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.remove_red_eye),
              hintText: 'Contraseña',
              labelText: 'Tu Contraseña',
            ),
          ));
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 79, 218, 83),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar sesion',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () {
            if (_formKeyPassword.currentState!.validate() &&
                _formKeyEmail.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Todo ok')));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => IndexMenu()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Por favor ingrese todos los campos')));
            }
          });
    });
  }
}
