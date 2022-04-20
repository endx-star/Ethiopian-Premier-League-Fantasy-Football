import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './registration.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final Map<String, String> _authData = {
    'email': ' ',
    'password': ' ',
  };
  var _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    // Sign user up
    await Provider.of<Auth>(context, listen: false).login(
      _authData['email'].toString(),
      _authData['password'].toString(),
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _switchAuthMode() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return Signup();
          },
        ),
      );
    }

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 180, 0, 1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromRGBO(0, 100, 0, 1).withOpacity(0.5),
                    const Color.fromRGBO(0, 128, 0, 1).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0, 1],
                ),
              ),
              margin: const EdgeInsets.only(top: 100.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
              transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
              child: const Text(
                'Fantasy Football',
                style: TextStyle(
                  // color: Theme.of(context).accentTextTheme.title.color,
                  fontSize: 30,
                  fontFamily: 'Anton',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 180),
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 8.0,
                  child: Container(
                    // height: deviceSize.height,
                    height: deviceSize.height,
                    constraints: const BoxConstraints(minHeight: 200),
                    width: deviceSize.width,
                    padding: const EdgeInsets.all(16.0),
                    color: const Color.fromRGBO(0, 128, 0, 1).withOpacity(0.9),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'E-Mail'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value.toString();
                            },
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short!';
                              }
                            },
                            onSaved: (value) {
                              _authData['password'] = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_isLoading)
                            const CircularProgressIndicator()
                          else
                            RaisedButton(
                              child: const Text('LOGIN'),
                              onPressed: _submit,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120.0, vertical: 8.0),
                              color: Theme.of(context).primaryColor,
                              // textColor: Theme.of(context).primaryTextTheme.button.color,
                            ),
                          FlatButton(
                            child: const Text(
                              'Don\'t have an account? Sign up here',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: _switchAuthMode,
                            // onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 4),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
