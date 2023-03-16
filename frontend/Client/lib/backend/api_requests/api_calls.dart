import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SIgnupCall {
  static Future<ApiCallResponse> call({
    String email = '',
    String password = '',
    String confirmpassword = '',
  }) {
    final body = '''
{
"email":"${email}",
  "password":"${password}",
"confirmpassword":"${password}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SIgnup',
      apiUrl: 'https://eplff.herokuapp.com/api/v1/users/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
        'confirmpassword': confirmpassword,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String emailcheck = '',
    String passwordCheck = '',
  }) {
    final body = '''
{
  "email":"${emailcheck}",
"password":"${passwordCheck}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://eplff.herokuapp.com/api/v1/users/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'emailcheck': emailcheck,
        'PasswordCheck': passwordCheck,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class HighlightsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'highlights',
      apiUrl: 'https://youtu.be/nwOFx63pzjk?list=TLPQMTUwNTIwMjLKNZB2NDYazA',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class DefendersListCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DefendersList',
      apiUrl: 'https://eplf.herokuapp.com/api/v1/players/defenders',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
        '_id': id,
      },
      returnBody: true,
    );
  }
}

class StandingsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Standings',
      apiUrl:
          'https://livescore-api.com/api-client/leagues/table.json?competition_id=273&key=F8Qv9PbOGBuYExun&secret=czhu61bDjpDuXdaCm18vQkkxVOwzl0Xx',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class HistoryCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'History',
      apiUrl:
          'https://livescore-api.com/api-client/scores/history.json?page=2&secret=czhu61bDjpDuXdaCm18vQkkxVOwzl0Xx&competition_id=273&key=F8Qv9PbOGBuYExun',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class SelectedDefsCall {
  static Future<ApiCallResponse> call({
    String defe1 = '',
    String defe2 = '',
    String defe3 = '',
    String defe4 = '',
    String defe5 = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SelectedDefs',
      apiUrl: 'https://eplf.herokuapp.com/api/v1/players/defenders',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'defe1': defe1,
        'defe2': defe2,
        'defe3': defe3,
        'defe4': defe4,
        'defe5': defe5,
      },
      returnBody: true,
    );
  }
}

class NewsfeedCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Newsfeed',
      apiUrl:
          'https://newsdata.io/api/1/news?apikey=pub_76330b58bcad0a566b010e9e99f557da92a0&q=premier%20league ',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GKlistCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GKlist',
      apiUrl: 'https://eplf.herokuapp.com/api/v1/players/goalkeepers',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
        '_id': id,
      },
      returnBody: true,
    );
  }
}

class MFListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'MFList',
      apiUrl: 'https://eplf.herokuapp.com/api/v1/players/midfielders',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class ForwardListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ForwardList',
      apiUrl: 'https://eplf.herokuapp.com/api/v1/players/forwards',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
