import '../../app_resources/app_resources_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class TodosCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'todos',
      apiUrl: 'https://jsonplaceholder.typicode.com/todos?_limit=5',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
    );
  }
}
