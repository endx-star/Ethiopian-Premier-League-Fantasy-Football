import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoinLeaguesWidget extends StatefulWidget {
  const JoinLeaguesWidget({Key key}) : super(key: key);

  @override
  _JoinLeaguesWidgetState createState() => _JoinLeaguesWidgetState();
}

class _JoinLeaguesWidgetState extends State<JoinLeaguesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF100D3C),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Join a League',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 1000,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF070735),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 1000,
                    height: 1000,
                    decoration: BoxDecoration(
                      color: Color(0xFF070735),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
