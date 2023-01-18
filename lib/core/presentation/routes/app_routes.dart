import 'package:conduit/core/dI/core_binding.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/auth_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/login_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/register_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/splash_bindings.dart';
import 'package:conduit/features/auth/presentation/screens/login_screen.dart';
import 'package:conduit/features/auth/presentation/screens/register_screen.dart';
import 'package:conduit/features/auth/presentation/screens/splash_screen.dart';
import 'package:conduit/features/home/presentation/controllers/dI/article_bindings.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:conduit/features/home/presentation/screens/widgets/article_detail_screen.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.register,
      page: () => RegisterScreen(),
      bindings: [
        CoreBinding(),
        RegisterBindings(),
      ],
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      bindings: [
        CoreBinding(),
        LoginBindings(),
      ],
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePageScreen(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: Routes.articleDetail,
      page: () => ArticleDetailScreen(
        articles: Get.arguments,
      ),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      bindings: [
        CoreBinding(),
        SplashBindings(),
        AuthBindings(),
      ],
    ),
  ];
}

class Routes {
  static const register = "/register";
  static const login = "/login";
  static const home = "/home";
  static const articleDetail = "/ArticleDetail";
  static const splashScreen = "/splashScreen";
}
