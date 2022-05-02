
import '../backend/api_requests/api_calls.dart';
import '../app_resources/app_resources_icon_button.dart';
import '../app_resources/app_resources_util.dart';
import 'package:flutter/material.dart';
import '../app_resources/app_resources_theme.dart';

class ResponsePageWidget extends StatefulWidget {
  const ResponsePageWidget({Key key}) : super(key: key);

  @override
  _ResponsePageWidgetState createState() => _ResponsePageWidgetState();
}

class _ResponsePageWidgetState extends State<ResponsePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appTheme.of(context).primaryColor,
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Response',
          style: appTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: appTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: FutureBuilder<ApiCallResponse>(
              future: TodosCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: appTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                final columnTodosResponse = snapshot.data;
                return Builder(
                  builder: (context) {
                    final todos = getJsonField(
                          (columnTodosResponse?.jsonBody ?? ''),
                          r'''$[:]''',
                        )?.toList() ??
                        [];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(todos.length, (todosIndex) {
                        final todosItem = todos[todosIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: ListTile(
                            title: Text(
                              getJsonField(
                                todosItem,
                                r'''$.title''',
                              ).toString(),
                              style: appTheme.of(context).title3,
                            ),
                            subtitle: Text(
                              getJsonField(
                                todosItem,
                                r'''$.completed''',
                              ).toString(),
                              style: appTheme.of(context).subtitle2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: appTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        );
                      }),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
