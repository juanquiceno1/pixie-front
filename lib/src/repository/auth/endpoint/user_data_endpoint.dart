import 'dart:io';

import '../../../api/endpoint.dart';
import '../../../services/local_storage.dart';

class UserDataEndpoint extends Endpoint {
  UserDataEndpoint();

  @override
  Method get method => Method.get;

  @override
  Map<String, String> get headers => {
        HttpHeaders.authorizationHeader: LocalStorage().token,
      };

  @override
  String get path => 'admin/api/users/user-data';
}
