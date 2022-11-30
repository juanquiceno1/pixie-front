enum Method { get, post, put, delete }

abstract class Endpoint {
  String get path;

  Method get method;

  Map<String, dynamic> parameters = {};

  Map<String, dynamic> queryParameters = {};

  Map<String, String> headers = {};

  Endpoint();
}
