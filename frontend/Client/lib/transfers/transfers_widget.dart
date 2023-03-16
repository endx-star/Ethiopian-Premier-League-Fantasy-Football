import '../backend/api_requests/api_calls.dart';
import '../def_list_pro/def_list_pro_widget.dart';
import '../fantasy_homepage/fantasy_homepage_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../g_klistpro/g_klistpro_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransfersWidget extends StatefulWidget {
  const TransfersWidget({
    Key key,
    this.keeper1name,
    this.keeper1kit,
    this.keeper2name,
    this.keeper2kit,
  }) : super(key: key);

  final String keeper1name;
  final String keeper1kit;
  final String keeper2name;
  final String keeper2kit;

  @override
  _TransfersWidgetState createState() => _TransfersWidgetState();
}

class _TransfersWidgetState extends State<TransfersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(27),
        child: AppBar(
          backgroundColor: Color(0xFF110C4B),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-0.9, -1),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FantasyHomepageWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.chevron_left,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24,
              ),
            ),
          ),
          flexibleSpace: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Text(
              'Transfers',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 19,
                  ),
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: Color(0xFF07132D),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Image.network(
                  'https://images.unsplash.com/photo-1546608235-3310a2494cdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=338&q=80',
                  width: 1000,
                  height: 711,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.4, -0.55),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: DefendersListCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerDefendersListResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefListProWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 75,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/hawassa.png',
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: DefendersListCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final textDefendersListResponse =
                                        snapshot.data;
                                    return Text(
                                      'A.Butako',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFDBD1D1),
                                            fontSize: 10,
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: DefendersListCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerDefendersListResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefListProWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 75,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/hawassa.png',
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'A.Butako',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFDBD1D1),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: DefendersListCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerDefendersListResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefListProWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 75,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/hawassa.png',
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'A.Butako',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFDBD1D1),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: DefendersListCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerDefendersListResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefListProWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 75,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/hawassa.png',
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'A.Butako',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFDBD1D1),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: DefendersListCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerDefendersListResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefListProWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 75,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/hawassa.png',
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'A.Butako',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFDBD1D1),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.9),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: GKlistCall.call(
                        name: widget.keeper1name,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerGKlistResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GKlistproWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  widget.keeper1kit,
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'A.Butako',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFDBD1D1),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: GKlistCall.call(
                        name: widget.keeper2name,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final containerGKlistResponse = snapshot.data;
                        return InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GKlistproWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF137D2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  widget.keeper2kit,
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'A.Butako',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFDBD1D1),
                                        fontSize: 10,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.45),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFF137D2F),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/hawassa.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                'A.Butako',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFF137D2F),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/hawassa.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                'A.Butako',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFF137D2F),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/hawassa.png',
                                width: 100,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              Text(
                                'A.Butako',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  width: 1000,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  alignment: AlignmentDirectional(-0.050000000000000044, 0),
                  child: Align(
                    alignment: AlignmentDirectional(0, -0.25),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.8, 0.6),
                          child: Text(
                            'Bank - 0.2 M',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFCCD3D7),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.05),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF137D2F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/hawassa.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'A.Butako',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF137D2F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/hawassa.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'A.Butako',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF137D2F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/hawassa.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'A.Butako',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF137D2F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/hawassa.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'A.Butako',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF137D2F),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/hawassa.png',
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            'A.Butako',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFDBD1D1),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
