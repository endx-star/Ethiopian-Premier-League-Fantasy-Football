// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import './screens/auth_screen.dart';
import './widgets/login.dart';
import './providers/auth.dart';
// import './widgets/create_team.dart';

void main() => runApp(Fantasy());

class Fantasy extends StatelessWidget {
  // const Fantasy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        // ChangeNotifierProvider.value(value:Players()),
      ],
      child: MaterialApp(
        title: 'Fantasy Football',
        theme: ThemeData(
          primarySwatch: Colors.green,
          // accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: LoginPage(),
      ),
    );
  }
}
