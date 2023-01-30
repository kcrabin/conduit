import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/profile/data/models/response/get_profile_response.dart';
import 'package:conduit/features/profile/domain/repository/get_current_user_repository.dart';
import 'package:get/get.dart';

class GetCurrentUserController extends GetxController {
  // User user = User();
  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  ApiResponse apiResponse = ApiResponse();

  getCurrentUserDetail() async {
    isLoading = true;
    apiResponse = await Get.find<GetCurrentUserRepository>().getCurrentUser();
    isLoading = false;
    // print(' this is user info ---${getProfileResponse.user!.email}');
    return apiResponse.data;

    // user = User()
  }
}
