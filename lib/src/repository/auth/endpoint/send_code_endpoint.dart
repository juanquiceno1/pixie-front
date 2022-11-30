import '../../../api/endpoint.dart';

class SendCodeEndpoint extends Endpoint {
  final String email;
  SendCodeEndpoint({required this.email});

  @override
  Method get method => Method.post;

  @override
  Map<String, dynamic> get parameters => {
        'email': email,
      };

  @override
  String get path => 'admin/api/users/auth/send-code';
}
