// ignore_for_file: file_names, camel_case_types
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../providers/club.dart';

class PickTeam extends StatelessWidget {
  const PickTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Squad Selection'),
      ),
      body: const squadSelection(),
    );
  }
}

class squadSelection extends StatefulWidget {
  const squadSelection({Key? key}) : super(key: key);

  @override
  State<squadSelection> createState() => _squadSelectionState();
}

class _squadSelectionState extends State<squadSelection> {
  late Future<Club> futureClub;

  @override
  void initState() {
    super.initState();
    futureClub = fetchClub();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Team Name",
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FutureBuilder<Club>(
                        future: futureClub,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!.name);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        }),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              // margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              // margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              // margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              // margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text("Reset"),
                  ),
                  Container(
                    child: Text(
                      "Bank",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Container(
                    child: Text("Confirm"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
