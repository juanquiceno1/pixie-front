import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../environment.dart';
import '../global_locator.dart';
import '../utils/lang/type_safety.dart';
import '../services/local_storage.dart';
import 'endpoint.dart';

enum Protocol { http, https }

abstract class APIRepository {
  Future<Map<String, dynamic>> request({required Endpoint endpoint});
  Future<Map<String, dynamic>> download({required String url});
}

class DefaultAPIRepository implements APIRepository {
  final _logger = global<Logger>();

  @override
  Future<Map<String, dynamic>> request({required Endpoint endpoint}) async {
    _logger.d('Request endpoint: ${endpoint.parameters}');
    Uri url;
    try {
      if (Environment.network.protocol == Protocol.https) {
        url = Uri.https(
          Environment.network.isDebug
              ? Environment.network.baseUrlDevelopment
              : Environment.network.baseUrlProduction,
          endpoint.path,
          endpoint.queryParameters,
        );
      } else {
        url = Uri.http(
          Environment.network.isDebug
              ? Environment.network.baseUrlDevelopment
              : Environment.network.baseUrlProduction,
          endpoint.path,
          endpoint.queryParameters,
        );
      }
    } catch (e) {
      _logger.e('APIRepository - Error parse uri$e ');
      Exception('Error parse uri $e');
      return {};
    }

    var headers = {...Environment.network.headers};
    headers.addAll(endpoint.headers);
    switch (endpoint.method) {
      case Method.get:
        return _get(url, headers).then(_handleResponse);
      case Method.post:
        return _post(url, headers, endpoint.parameters).then(_handleResponse);
      case Method.put:
        return _put(url, headers, endpoint.parameters).then(_handleResponse);
      case Method.delete:
        return _delete(url, headers, endpoint.parameters).then(_handleResponse);
    }
  }

  Future<Response> _get(Uri url, Map<String, String> headers) {
    _logger.d('get() with url ($url) - headers ($headers)');
    return http.get(url, headers: headers);
  }

  Future<Response> _post(
      Uri url, Map<String, String> headers, Map<String, dynamic> body) {
    _logger.d('post() with url ($url) - headers ($headers) - body ($body)');
    return http.post(
      url,
      headers: headers,
      body: json.encode(body), /* encoding: Utf8Codec() */
    );
  }

  Future<Response> _put(
      Uri url, Map<String, String> headers, Map<String, dynamic> body) {
    _logger.d('put() with url ($url) - headers ($headers) - body ($body)');
    return http.put(url,
        headers: headers, body: jsonEncode(body), encoding: Utf8Codec());
  }

  Future<Response> _delete(
      Uri url, Map<String, String> headers, Map<String, dynamic> body) {
    _logger.d('delete() with url ($url) - headers ($headers) - body ($body)');
    return http.delete(url,
        headers: headers, body: jsonEncode(body), encoding: Utf8Codec());
  }

  Map<String, dynamic> _handleResponse(Response response) {
    _logger.d('Response - statusCode: ${response.statusCode}');
    final decodedBody = json.decode(response.body);
    if (response.headers.containsKey('authorization')) {
      LocalStorage().setToken = response.headers['authorization'] ?? '';
    } else if (decodedBody.containsKey('token')) {
      LocalStorage().setToken = decodedBody['token'] ?? '';
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic>? map = cast<Map<String, dynamic>>(decodedBody);
      if (map != null) {
        map.addAll({'statusCode': response.statusCode});
        _logger.d('Response - body map: $map');
        return map;
      }
    }
    _logger.d('Response error ${response.body}');
    var map = cast<Map<String, dynamic>>(decodedBody);
    if (map != null) {
      map.addAll({'statusCode': response.statusCode});
      _logger.d('Response - body map: $map');
      return map;
    }
    return {'statusCode': response.statusCode};
    // throw Exception('Error with http code ${response.body}');
  }

  @override
  Future<Map<String, dynamic>> download({required String url}) {
    // TODO: implement download
    throw UnimplementedError();
  }
}
