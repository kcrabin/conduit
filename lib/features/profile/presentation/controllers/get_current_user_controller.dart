import 'package:conduit/features/profile/data/models/response/get_profile_response.dart';
import 'package:conduit/features/profile/domain/repository/get_current_user_repository.dart';
import 'package:get/get.dart';

class GetCurrentUserController extends GetxController {
  late GetProfileResponse getProfileResponse;
  // User user = User();
  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  getCurrentUserDetail() async {
    isLoading = true;
    var data = await Get.find<GetCurrentUserRepository>().getCurrentUser();
    getProfileResponse = GetProfileResponse.fromJson(data);
    isLoading = false;
    // print(' this is user info ---${getProfileResponse.user!.email}');
    return getProfileResponse;

    // user = User()
  }
}
