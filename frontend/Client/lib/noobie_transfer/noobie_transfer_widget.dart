import '../customize_team/customize_team_widget.dart';
import '../defrnders_list/defrnders_list_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../transfers/transfers_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoobieTransferWidget extends StatefulWidget {
  const NoobieTransferWidget({
    Key key,
    this.name,
  }) : super(key: key);

  final String name;

  @override
  _NoobieTransferWidgetState createState() => _NoobieTransferWidgetState();
}

class _NoobieTransferWidgetState extends State<NoobieTransferWidget> {
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
                    builder: (context) => NavBarPage(initialPage: 'HomePage'),
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
              'Create new Team',
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
      backgroundColor: Color(0xFF070735),
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
                  height: 740,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  width: 1000,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  alignment: AlignmentDirectional(-0.050000000000000044, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bank : 100M',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFD7DEDE),
                              fontSize: 18,
                            ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomizeTeamWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.navigate_next,
                          color: Color(0xFFFFFCFC),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.9),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransfersWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
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
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                widget.name,
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.05),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransfersWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DefrndersListWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x08FDFDFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              'https://cdn.vectorstock.com/i/1000x1000/02/60/blank-soccer-shirt-vector-27020260.webp',
                              width: 100,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              width: 100,
                              height: 17,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E601F),
                              ),
                              child: Text(
                                '     name',
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
                                '      club',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
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
