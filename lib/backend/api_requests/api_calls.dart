import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetClinicLocationCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getClinicLocation',
      apiUrl: 'https://equwagvjdxakpzztwpgi.supabase.co/rest/v1/doctors_info',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxdXdhZ3ZqZHhha3B6enR3cGdpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk5OTA4NTcsImV4cCI6MjAzNTU2Njg1N30.pFqRze93u9E-F3ediYLEUM3bxWQpeX0fuxtXSBFyXlY',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDoctorsCall {
  static Future<ApiCallResponse> call({
    String? fullname = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDoctors',
      apiUrl:
          'https://equwagvjdxakpzztwpgi.supabase.co/rest/v1/doctors_info?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxdXdhZ3ZqZHhha3B6enR3cGdpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk5OTA4NTcsImV4cCI6MjAzNTU2Njg1N30.pFqRze93u9E-F3ediYLEUM3bxWQpeX0fuxtXSBFyXlY',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVxdXdhZ3ZqZHhha3B6enR3cGdpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk5OTA4NTcsImV4cCI6MjAzNTU2Njg1N30.pFqRze93u9E-F3ediYLEUM3bxWQpeX0fuxtXSBFyXlY',
        'Range': '0-9',
      },
      params: {
        'fullname': fullname,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
