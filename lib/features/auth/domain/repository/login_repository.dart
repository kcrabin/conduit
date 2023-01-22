import 'package:conduit/features/auth/data/model/request/login_request_model.dart';
import 'package:conduit/features/auth/data/model/request/register_request_model.dart';

abstract class LoginRepository {
  requestLogin(LoginRequest user);
}
