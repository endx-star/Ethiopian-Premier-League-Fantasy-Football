// import 'package:flutter/material.dart';
// import 'dart:math';

// import 'package:provider/provider.dart';
// import '../providers/auth.dart';
// import './registration.dart';
// import './squad-selection.dart';

// class Login extends StatefulWidget {
//   static const routeName = '/login';
//   Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GlobalKey<FormState> _formKey = GlobalKey();

//   final Map<String, String> _authData = {
//     'email': ' ',
//     'password': ' ',
//   };

//   void squadSelection() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) {
//           return const PickTeam();
//         },
//       ),
//     );
//   }

//   var _isLoading = false;

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) {
//       // Invalid!
//       return;
//     }
//     _formKey.currentState?.save();
//     setState(() {
//       _isLoading = true;
//     });

//     // Sign user up
//     await Provider.of<Auth>(context, listen: false).login(
//       _authData['email'].toString(),
//       _authData['password'].toString(),
//     );

//     setState(() {
//       _isLoading = false;
//       squadSelection();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     void _switchAuthMode() {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (_) {
//             return Signup();
//           },
//         ),
//       );
//     }

//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(0, 180, 0, 1),
//       body: SafeArea(
//         child: Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Form(
//                 key: _formKey,
//                 child: Expanded(
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         decoration: const InputDecoration(labelText: 'E-Mail'),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value!.isEmpty || !value.contains('@')) {
//                             return 'Invalid email!';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           _authData['email'] = value.toString();
//                         },
//                       ),
//                       TextFormField(
//                         decoration:
//                             const InputDecoration(labelText: 'Password'),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value!.isEmpty || value.length < 8) {
//                             return 'Password is too short!';
//                           }
//                         },
//                         onSaved: (value) {
//                           _authData['password'] = value.toString();
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       if (_isLoading)
//                         const CircularProgressIndicator()
//                       else
//                         ElevatedButton(
//                           child: const Text('LOGIN'),
//                           onPressed: _submit,
//                         ),
//                       TextButton(
//                         child: const Text(
//                           'Don\'t have an account? Sign up here',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         onPressed: _switchAuthMode,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import './squad-selection.dart';
import './registration.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  bool loginClicked = false;
  String token = ' ';

  @override
  void initState() {
    super.initState();
  }

  void connectingFailed() {}
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

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 100, 0, 1),
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(22, 108, 109, 1)),
        inAsyncCall: loginClicked,
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            alignment: Alignment.center,
            height: 530,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
            padding:
                const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 20),
            child: ListView(
              children: [
                const Text(
                  "Fantasy Football",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Anton-Regular",
                      fontSize: 40,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.fromLTRB(5, 0, 30, 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(216, 216, 216, 1)),
                  child: TextField(
                    cursorColor: const Color.fromRGBO(0, 108, 0, 1),
                    controller: controllerEmail,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email,
                            color: Color.fromRGBO(0, 108, 0, 1)),
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(5, 0, 30, 1),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(216, 216, 216, 1)),
                  child: TextField(
                    obscureText: true,
                    controller: controllerPass,
                    cursorColor: const Color.fromRGBO(0, 108, 0, 1),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(0, 108, 0, 1),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                MyButton(
                  text: "LOGIN",
                  pressed: () async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      loginClicked = true;
                    });
                    Future.delayed(const Duration(seconds: 30), () {
                      if (loginClicked) {
                        setState(() {
                          loginClicked = false;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text("Something went wrong"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Your Internet Connection is unreliable")
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      loginClicked = false;
                                    });
                                  },
                                  child: const Text("Ok"))
                            ],
                          ),
                        );
                      }
                    });
                    try {
                      var result = await Connectivity().checkConnectivity();
                      if (controllerEmail.value.text.isNotEmpty &&
                          controllerPass.value.text.isNotEmpty &&
                          (result == ConnectivityResult.mobile ||
                              result == ConnectivityResult.wifi)) {
                        var url = Uri.parse(
                            'http://192.168.137.44:3000/api/v1/users/login');
                        var response = await http.post(url,
                            headers: {
                              'Content-Type': 'application/json',
                            },
                            body: jsonEncode({
                              "email": controllerEmail.value.text,
                              "password": controllerPass.value.text,
                            }));
                        var responseStatus = jsonDecode(response.body);
                        print(responseStatus);
                        if (responseStatus['token'] != null) {
                          token = responseStatus['token'];
                          setState(() {
                            loginClicked = false;
                          });
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PickTeam()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title:
                                        const Text("Invalid Email or password"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text("Please verify your credentials")
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              loginClicked = false;
                                            });
                                          },
                                          child: const Text("Ok"))
                                    ],
                                  ));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Something went wrong"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      result == ConnectivityResult.mobile ||
                                              result == ConnectivityResult.wifi
                                          ? const Text(
                                              "Please enter both of the email field and password field")
                                          : const Text(
                                              "Please check your internet connection")
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            loginClicked = false;
                                          });
                                        },
                                        child: const Text("Ok"))
                                  ],
                                ));
                      }
                    } catch (err) {}
                  },
                  color: const Color.fromRGBO(0, 108, 10, 1),
                ),
                const SizedBox(height: 20),
                Container(
                  child: TextButton(
                    child: const Text(
                      'Don\'t have an account? Sign up here',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    onPressed: _switchAuthMode,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Function() pressed;
  final Color color;
  // ignore: use_key_in_widget_constructors
  MyButton({required this.text, required this.color, required this.pressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 108, 10, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextButton(
        onPressed: pressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
