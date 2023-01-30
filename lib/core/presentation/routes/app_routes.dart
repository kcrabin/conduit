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
import 'package:conduit/features/profile/presentation/controllers/dI/delete_article_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/edit_article_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/fav_articles_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/get_current_user_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/my_articles_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/profile_bindings.dart';
import 'package:conduit/features/profile/presentation/controllers/dI/update_profile_bindings.dart';
import 'package:conduit/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:conduit/features/profile/presentation/screens/fav_articles_screen.dart';
import 'package:conduit/features/profile/presentation/screens/my_articles_screen.dart';
import 'package:conduit/features/profile/presentation/screens/profile_screen.dart';
import 'package:conduit/features/profile/presentation/screens/edit_article_screen.dart';
import 'package:get/route_manager.dart';

import '../../../features/notification/presentation/screens/create_notification_screen.dart';
import '../../../features/profile/presentation/screens/my_article_detail_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      bindings: [
        CoreBinding(),
        RegisterBindings(),
      ],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      bindings: [
        CoreBinding(),
        LoginBindings(),
      ],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePageScreen(),
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
      page: () => const SplashScreen(),
      bindings: [
        CoreBinding(),
        SplashBindings(),
        AuthBindings(),
      ],
    ),
    GetPage(
        name: Routes.navigationScreen,
        page: () => const NavigationScreen(),
        bindings: [
          NavigationBinding(),
          GetAllArticleBinding(),
          AddNewArticleBindings(),
          FavoriteArticleBinding(),
          CommentBindings(),
          ProfileBindings(),
          // MyArticleBindings(),
          GetCurrentUserBindings(),
          GetSingleArticleBySlugBindings(),

          // TaglistBindings(),
        ]),
    GetPage(
      name: Routes.addArticleScreen,
      page: () => const AddArticleScreen(),
      binding: AddNewArticleBindings(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      bindings: [
        ProfileBindings(),
        FavoriteArticleBinding(),
        GetCurrentUserBindings(),
      ],
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const CreateNotification(),
      binding: NotificationBindings(),
    ),
    GetPage(
      name: Routes.showNotification,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.myArticleDetail,
      page: () => MyArticleDetailScreen(
        slug: Get.arguments,
      ),
      bindings: [
        GetSingleArticleBySlugBindings(),
        DeleteArticleBindings(),
      ],
    ),
    GetPage(
      name: Routes.myArticleScreen,
      page: () => const MyArticles(),
      binding: MyArticleBindings(),
    ),
    GetPage(
      name: Routes.favArticlesScreen,
      page: () => const MyFavArticles(),
      binding: GetFavArticlesBindings(),
    ),
    GetPage(
      name: Routes.tagListScreen,
      page: () => const TaglistScreen(),
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
    GetPage(
      name: Routes.editArticleScreen,
      page: () => EditArticleScreen(
        article: Get.arguments,
      ),
      binding: EditArticleBindings(),
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: UpdateUserInfoBindings(),
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
  static const profileScreen = "/profile";
  static const notifications = "/notifications";
  static const showNotification = "/showNotification";
  static const myArticleDetail = "/myArticleDetail";
  static const myArticleScreen = "/myArticles";
  static const favArticlesScreen = "/favArticleScreen";
  static const tagListScreen = "/tagListScreen";
  static const articlesByTagScreen = "/articleByTagScreen";
  static const editArticleScreen = "/editArticleScreen";
  static const editProfileScreen = "/editProfileScreen";
}
