import 'package:flutter/material.dart';

class PickTeam extends StatelessWidget {
  const PickTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick Team'),
        ),
        body: const Center(
          child: Text('Create Team'),
        ));
  }
}
