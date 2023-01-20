import 'package:conduit/core/dI/core_binding.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/auth_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/login_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/register_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/splash_bindings.dart';
import 'package:conduit/features/auth/presentation/screens/login_screen.dart';
import 'package:conduit/features/auth/presentation/screens/register_screen.dart';
import 'package:conduit/features/auth/presentation/screens/splash_screen.dart';
import 'package:conduit/features/home/presentation/controllers/dI/add_new_article_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/like_unlike_article_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/get_all_article_bindings.dart';
import 'package:conduit/features/home/presentation/screens/add_article_screen.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:conduit/features/home/presentation/screens/widgets/article_detail_screen.dart';
import 'package:conduit/features/navigation/presentation/controller/dI/navigation_bindings.dart';
import 'package:conduit/features/navigation/presentation/screens/navigation_screen.dart';
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
      bindings: [
        GetAllArticleBinding(),
        FavoriteArticleBinding(),
      ],
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
    GetPage(
        name: Routes.navigationScreen,
        page: () => NavigationScreen(),
        bindings: [
          NavigationBinding(),
          GetAllArticleBinding(),
          AddNewArticleBindings(),
          FavoriteArticleBinding(),
        ]),
    GetPage(
      name: Routes.addArticleScreen,
      page: () => AddArticleScreen(),
      binding: AddNewArticleBindings(),
    )
  ];
}

class Routes {
  static const register = "/register";
  static const login = "/login";
  static const home = "/home";
  static const articleDetail = "/ArticleDetail";
  static const splashScreen = "/splashScreen";
  static const navigationScreen = "/navigation";
  static const addArticleScreen = "/addNewArticle";
}
