import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../noobie_transfer/noobie_transfer_widget.dart';
import '../transfers/transfers_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefrndersListWidget extends StatefulWidget {
  const DefrndersListWidget({Key key}) : super(key: key);

  @override
  _DefrndersListWidgetState createState() => _DefrndersListWidgetState();
}

class _DefrndersListWidgetState extends State<DefrndersListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0B0735),
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
                builder: (context) => TransfersWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Defenders List',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Kit',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      'Full Name',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      'Price ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      'Total Points',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        final columnDefendersListResponse = snapshot.data;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                getJsonField(
                                  (columnDefendersListResponse?.jsonBody ?? ''),
                                  r'''$.data.doc[83].club[0].jersey''',
                                ),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
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
                        final columnDefendersListResponse = snapshot.data;
                        return Builder(
                          builder: (context) {
                            final name = getJsonField(
                                  (columnDefendersListResponse?.jsonBody ?? ''),
                                  r'''$.data.doc[*]''',
                                )?.toList() ??
                                [];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(name.length, (nameIndex) {
                                  final nameItem = name[nameIndex];
                                  return InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NoobieTransferWidget(
                                            name: '',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      getJsonField(
                                        nameItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
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
                        final columnDefendersListResponse = snapshot.data;
                        return Builder(
                          builder: (context) {
                            final price = getJsonField(
                                  (columnDefendersListResponse?.jsonBody ?? ''),
                                  r'''$.data.doc[*]''',
                                )?.toList() ??
                                [];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(price.length, (priceIndex) {
                                  final priceItem = price[priceIndex];
                                  return Text(
                                    getJsonField(
                                      priceItem,
                                      r'''$.price''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  );
                                }),
                              ),
                            );
                          },
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
                        final columnDefendersListResponse = snapshot.data;
                        return Builder(
                          builder: (context) {
                            final tp = getJsonField(
                                  (columnDefendersListResponse?.jsonBody ?? ''),
                                  r'''$.data.doc[*]''',
                                )?.toList() ??
                                [];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(tp.length, (tpIndex) {
                                  final tpItem = tp[tpIndex];
                                  return Text(
                                    getJsonField(
                                      tpItem,
                                      r'''$.totalPoint''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  );
                                }),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
