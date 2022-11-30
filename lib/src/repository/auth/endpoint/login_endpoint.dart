import '../../../api/endpoint.dart';
import '../../../models/auth/login_model.dart';

class LoginEndpoint extends Endpoint {
  final LoginModel model;
  LoginEndpoint({required this.model});

  @override
  Method get method => Method.post;

  @override
  Map<String, dynamic> get parameters => {
        'email': model.email,
        'password': model.password,
      };

  @override
  String get path => 'admin/api/users/login';
}
