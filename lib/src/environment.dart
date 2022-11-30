import 'dart:io';
import '../src/api/api_repository.dart';

abstract class Environment {
  static const network = Network._();
}

class Network {
  const Network._();

  final Map<String, String> headers = const {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  final bool isDebug = true;
  final Protocol protocol = Protocol.http;
  final String baseUrlProduction = 'https//imagineapps.co';
  final String baseUrlDevelopment = 'localhost:4000';
}
