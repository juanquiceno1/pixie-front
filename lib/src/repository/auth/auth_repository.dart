import '../../api/api_repository.dart';
import '../../global_locator.dart';
import '../../models/auth/login_model.dart';
import '../../models/auth/register_user_model.dart';
import 'endpoint/login_endpoint.dart';
import 'endpoint/register_endpoint.dart';
import 'endpoint/user_data_endpoint.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>> login({required LoginModel model});
  Future<Map<String, dynamic>> userData();
  Future<Map<String, dynamic>> register({required RegisterUserModel model});
}

class AuthDefault extends AuthRepository {
  final _api = global<APIRepository>();

  @override
  Future<Map<String, dynamic>> login({required LoginModel model}) async {
    var endpoint = LoginEndpoint(model: model);
    return await _api.request(
      endpoint: endpoint,
    );
  }

  @override
  Future<Map<String, dynamic>> userData() async {
    var endpoint = UserDataEndpoint();
    return await _api.request(
      endpoint: endpoint,
    );
  }

  @override
  Future<Map<String, dynamic>> register({required RegisterUserModel model}) async {
    var endpoint = RegisterEndpoint(model: model);
    return await _api.request(
      endpoint: endpoint,
    );
  }
}
