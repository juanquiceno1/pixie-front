import '../../../api/endpoint.dart';
import '../../../models/auth/register_user_model.dart';

class RegisterEndpoint extends Endpoint {
  final RegisterUserModel model;
  RegisterEndpoint({required this.model});

  @override
  Method get method => Method.post;

  @override
  Map<String, dynamic> get parameters => {
        'email': model.email,
        'password': model.password,
        'name': model.name,
        'last_name': model.lastName
      };

  @override
  String get path => 'admin/api/users/register';
}
