import 'package:conduit/features/auth/data/model/request/register_request_model.dart';

abstract class RegisterRepository {
  requestRegister(RegisterUser user);
}
