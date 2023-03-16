import '../fantasy_homepage/fantasy_homepage_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickTeamWidget extends StatefulWidget {
  const PickTeamWidget({Key key}) : super(key: key);

  @override
  _PickTeamWidgetState createState() => _PickTeamWidgetState();
}

class _PickTeamWidgetState extends State<PickTeamWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF070735),
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
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FantasyHomepageWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Pick Team',
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
      backgroundColor: Color(0xFF070735),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1546608235-3310a2494cdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=338&q=80',
                width: 1000,
                height: 650,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.95),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '      salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '        ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.55),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.35),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.1),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x08FDFDFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/st.Gorges.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            width: 100,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E601F),
                            ),
                            child: Text(
                              '  salhadin',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Color(0xFF2CDC46),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(44),
                                bottomRight: Radius.circular(44),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              '   ST.GRGE',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.9),
                child: Container(
                  width: 1000,
                  height: 119,
                  decoration: BoxDecoration(
                    color: Color(0xFF05350A),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, -0.55),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x08FDFDFF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/st.Gorges.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.fitHeight,
                              ),
                              Container(
                                width: 100,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0E601F),
                                ),
                                child: Text(
                                  '  salhadin',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2CDC46),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(44),
                                    bottomRight: Radius.circular(44),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Text(
                                  '   ST.GRGE',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x08FDFDFF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/st.Gorges.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.fitHeight,
                              ),
                              Container(
                                width: 100,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0E601F),
                                ),
                                child: Text(
                                  '  salhadin',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2CDC46),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(44),
                                    bottomRight: Radius.circular(44),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Text(
                                  '   ST.GRGE',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x08FDFDFF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/st.Gorges.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.fitHeight,
                              ),
                              Container(
                                width: 100,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0E601F),
                                ),
                                child: Text(
                                  '  salhadin',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2CDC46),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(44),
                                    bottomRight: Radius.circular(44),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Text(
                                  '   ST.GRGE',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x08FDFDFF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/st.Gorges.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.fitHeight,
                              ),
                              Container(
                                width: 100,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0E601F),
                                ),
                                child: Text(
                                  '  salhadin',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2CDC46),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(44),
                                    bottomRight: Radius.circular(44),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Text(
                                  '   ST.GRGE',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
