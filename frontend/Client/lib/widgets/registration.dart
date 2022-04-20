import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './login.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final Map<String, String> _authData = {
    'firstName': ' ',
    'lastName': ' ',
    'email': ' ',
    'password': ' ',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

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
    await Provider.of<Auth>(context, listen: false).signup(
      _authData['firstName'].toString(),
      _authData['lastName'].toString(),
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
            return Login();
          },
        ),
      );
    }

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 8.0,
              child: Container(
                // height: deviceSize.height,
                height: 450,
                constraints: const BoxConstraints(minHeight: 400),
                width: deviceSize.width,
                padding: const EdgeInsets.all(16.0),
                color: Colors.green.shade300,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'First Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Name is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['firstName'] = value.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Last Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last Name is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['lastName'] = value.toString();
                          },
                        ),
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
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password is too short!';
                            }
                          },
                          onSaved: (value) {
                            _authData['password'] = value.toString();
                          },
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        if (_isLoading)
                          const CircularProgressIndicator()
                        else
                          RaisedButton(
                            child: const Text('SIGN UP'),
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
                            'Already have account? Login here',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: _switchAuthMode,
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
            )
          ],
        ),
      ),
    );
  }
}
