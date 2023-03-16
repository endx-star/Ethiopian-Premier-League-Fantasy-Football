import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../transfers/transfers_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GKlistproWidget extends StatefulWidget {
  const GKlistproWidget({
    Key key,
    this.kepo1,
  }) : super(key: key);

  final String kepo1;

  @override
  _GKlistproWidgetState createState() => _GKlistproWidgetState();
}

class _GKlistproWidgetState extends State<GKlistproWidget> {
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
          'Keepers list',
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 390,
                    height: 50,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Kit',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          'Player Name',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          'Price',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          'Total Point',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              FutureBuilder<ApiCallResponse>(
                future: GKlistCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final columnGKlistResponse = snapshot.data;
                  return Builder(
                    builder: (context) {
                      final playerlist = getJsonField(
                            (columnGKlistResponse?.jsonBody ?? ''),
                            r'''$.data.doc[*]''',
                          )?.toList() ??
                          [];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(playerlist.length, (playerlistIndex) {
                          final playerlistItem = playerlist[playerlistIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 390,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TransfersWidget(
                                          keeper1name: getJsonField(
                                            playerlistItem,
                                            r'''$.name''',
                                          ).toString(),
                                          keeper1kit: getJsonField(
                                            playerlistItem,
                                            r'''$.club[*].jersey''',
                                          ),
                                          keeper2name: getJsonField(
                                            (columnGKlistResponse?.jsonBody ??
                                                ''),
                                            r'''$.doc[*].name''',
                                          ).toString(),
                                          keeper2kit: getJsonField(
                                            playerlistItem,
                                            r'''$.club[*].jersey''',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        getJsonField(
                                          playerlistItem,
                                          r'''$.club[*].jersey''',
                                        ),
                                        width: 65,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        getJsonField(
                                          playerlistItem,
                                          r'''$.name''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        getJsonField(
                                          playerlistItem,
                                          r'''$.price''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        getJsonField(
                                          playerlistItem,
                                          r'''$.totalPoint''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
