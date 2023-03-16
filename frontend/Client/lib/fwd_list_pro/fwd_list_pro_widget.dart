import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FwdListProWidget extends StatefulWidget {
  const FwdListProWidget({Key key}) : super(key: key);

  @override
  _FwdListProWidgetState createState() => _FwdListProWidgetState();
}

class _FwdListProWidgetState extends State<FwdListProWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0D0935),
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
          'Forwards List',
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        child: Text(
                          '       kit',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 25,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        child: Text(
                          'Player Name',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        child: Text(
                          'Price',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        child: Text(
                          'Tp',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder<ApiCallResponse>(
                        future: ForwardListCall.call(),
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
                          final columnForwardListResponse = snapshot.data;
                          return Builder(
                            builder: (context) {
                              final kit = getJsonField(
                                    (columnForwardListResponse?.jsonBody ?? ''),
                                    r'''$.data.doc[*].club[*]''',
                                  )?.toList() ??
                                  [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(kit.length, (kitIndex) {
                                  final kitItem = kit[kitIndex];
                                  return Container(
                                    width: 70,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: MFListCall.call(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final imageMFListResponse =
                                            snapshot.data;
                                        return Image.network(
                                          getJsonField(
                                            kitItem,
                                            r'''$.jersey''',
                                          ),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        );
                                      },
                                    ),
                                  );
                                }),
                              );
                            },
                          );
                        },
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: ForwardListCall.call(),
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
                          final columnForwardListResponse = snapshot.data;
                          return Builder(
                            builder: (context) {
                              final names = getJsonField(
                                    (columnForwardListResponse?.jsonBody ?? ''),
                                    r'''$.data.doc[*]''',
                                  )?.toList() ??
                                  [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(names.length, (namesIndex) {
                                  final namesItem = names[namesIndex];
                                  return Container(
                                    width: 200,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                                    child: Text(
                                      getJsonField(
                                        namesItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  );
                                }),
                              );
                            },
                          );
                        },
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: ForwardListCall.call(),
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
                          final columnForwardListResponse = snapshot.data;
                          return Builder(
                            builder: (context) {
                              final price = getJsonField(
                                    (columnForwardListResponse?.jsonBody ?? ''),
                                    r'''$.data.doc[*]''',
                                  )?.toList() ??
                                  [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(price.length, (priceIndex) {
                                  final priceItem = price[priceIndex];
                                  return Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                                    child: Text(
                                      getJsonField(
                                        priceItem,
                                        r'''$.price''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  );
                                }),
                              );
                            },
                          );
                        },
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: ForwardListCall.call(),
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
                          final columnForwardListResponse = snapshot.data;
                          return Builder(
                            builder: (context) {
                              final tp = getJsonField(
                                    (columnForwardListResponse?.jsonBody ?? ''),
                                    r'''$.data.doc[*]''',
                                  )?.toList() ??
                                  [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(tp.length, (tpIndex) {
                                  final tpItem = tp[tpIndex];
                                  return Container(
                                    width: 60,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                                    child: Text(
                                      getJsonField(
                                        tpItem,
                                        r'''$.totalPoint''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  );
                                }),
                              );
                            },
                          );
                        },
                      ),
                    ],
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
