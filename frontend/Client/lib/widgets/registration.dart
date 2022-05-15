import 'package:flutter/material.dart';
import 'package:frontend/widgets/squad-selection.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './login.dart';
import './squad-selection.dart';

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

  void squadSelection() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const PickTeam();
        },
      ),
    );
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
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
    squadSelection();
  }

  @override
  Widget build(BuildContext context) {
    void _switchAuthMode() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return LoginPage();
          },
        ),
      );
    }

    // final deviceSize = MediaQuery.of(context).size;
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
                height: 550,
                constraints: const BoxConstraints(minHeight: 450),
                width: double.infinity,
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
                            child: const Text('SIGN UP',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
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
                            style: TextStyle(color: Colors.black, fontSize: 18),
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
