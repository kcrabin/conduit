import 'package:conduit/core/dI/core_binding.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/auth_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/login_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/register_bindings.dart';
import 'package:conduit/features/auth/presentation/controllers/dI/splash_bindings.dart';
import 'package:conduit/features/auth/presentation/screens/login_screen.dart';
import 'package:conduit/features/auth/presentation/screens/register_screen.dart';
import 'package:conduit/features/auth/presentation/screens/splash_screen.dart';
import 'package:conduit/features/home/presentation/controllers/dI/add_new_article_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/article_by_tag_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/comment_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/get_single_article_by_slug_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/like_unlike_article_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/get_all_article_bindings.dart';
import 'package:conduit/features/home/presentation/controllers/dI/taglist_bindings.dart';
import 'package:conduit/features/home/presentation/screens/add_article_screen.dart';
import 'package:conduit/features/home/presentation/screens/articles_by_tag_screen.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:conduit/features/home/presentation/screens/taglist_screen.dart';
// import 'package:conduit/features/home/presentation/screens/widgets/article_by_tag_detail_screen.dart';
import 'package:conduit/features/home/presentation/screens/widgets/article_detail_screen.dart';
import 'package:conduit/features/navigation/presentation/controller/dI/navigation_bindings.dart';
import 'package:conduit/features/navigation/presentation/screens/navigation_screen.dart';
import 'package:conduit/features/notification/presentation/controller/dI/notification_bindings.dart';
import 'package:conduit/features/notification/presentation/screens/notification_screens.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/fav_articles_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/my_articles_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/profile_bindings.dart';
import 'package:conduit/features/profile/presentation/screens/fav_articles_screen.dart';
import 'package:conduit/features/profile/presentation/screens/my_articles_screen.dart';
import 'package:conduit/features/profile/presentation/screens/profile_screen.dart';
import 'package:get/route_manager.dart';

import '../../../features/notification/presentation/screens/create_notification_screen.dart';
import '../../../features/profile/presentation/screens/widgets/my_article_detail_screen.dart';

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
        CommentBindings(),
        GetSingleArticleBySlugBindings(),
      ],
    ),
    GetPage(
      name: Routes.articleDetail,
      page: () => ArticleDetailScreen(
        slug: Get.arguments,
      ),
      binding: GetSingleArticleBySlugBindings(),
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
          CommentBindings(),
          ProfileBindings(),
          MyArticleBindings(),
          GetFavArticlesBindings(),
          GetSingleArticleBySlugBindings(),
          // TaglistBindings(),
        ]),
    GetPage(
      name: Routes.addArticleScreen,
      page: () => AddArticleScreen(),
      binding: AddNewArticleBindings(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBindings(),
        FavoriteArticleBinding(),
      ],
    ),
    GetPage(
      name: Routes.notifications,
      page: () => CreateNotification(),
      binding: NotificationBindings(),
    ),
    GetPage(
      name: Routes.showNotification,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: Routes.myArticleDetail,
      page: () => MyArticleDetailScreen(
        slug: Get.arguments,
      ),
      binding: GetSingleArticleBySlugBindings(),
    ),
    GetPage(
      name: Routes.myArticleScreen,
      page: () => MyArticles(),
      binding: MyArticleBindings(),
    ),
    GetPage(
      name: Routes.favArticlesScreen,
      page: () => MyFavArticles(),
      binding: GetFavArticlesBindings(),
    ),
    GetPage(
      name: Routes.tagListScreen,
      page: () => TaglistScreen(),
      bindings: [
        TaglistBindings(),
        ArticlesByTagBindings(),
      ],
    ),
    GetPage(
      name: Routes.articlesByTagScreen,
      page: () => ArticlesByTagScreen(
        tagName: Get.arguments,
      ),
      binding: ArticlesByTagBindings(),
    ),
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
  static const profileScreen = "/profile";
  static const notifications = "/notifications";
  static const showNotification = "/showNotification";
  static const myArticleDetail = "/myArticleDetail";
  static const myArticleScreen = "/myArticles";
  static const favArticlesScreen = "/favArticleScreen";
  static const tagListScreen = "/tagListScreen";
  static const articlesByTagScreen = "/articleByTagScreen";
}
