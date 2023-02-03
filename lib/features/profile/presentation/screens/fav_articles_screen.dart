import 'package:conduit/features/profile/presentation/controllers/fav_articles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/network_exception.dart';
import '../../../../core/presentation/themes/app_themes.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/utils/spacing.dart';
import '../../../../core/presentation/widgets/error_view.dart';
import '../../../../core/presentation/widgets/shimmer.dart';
import '../../../home/presentation/controllers/get_single_article_by_slug_controller.dart';
import '../../../home/presentation/controllers/like_unlike_article_controller.dart';

class MyFavArticles extends StatelessWidget {
  const MyFavArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final favarticleController = Get.find<FavoriteArticleController>();
    final getSingleArticleBySlugController =
        Get.find<GetSingleArticleBySlugController>();
    final getFavArticleController = Get.find<GetFavArticlesController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Favorite Articles',
            style: AppThemes.textTheme.headline4,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Get.toNamed("/notifications");
          //       },
          //       icon: Icon(
          //         Icons.notifications,
          //         color: primaryColor2,
          //         size: 30,
          //       )),
          // ],
        ),
        body:
            // getFavArticleController.isLoading == true
            //     ? Center(
            //         child: Lottie.asset('assets/lottie/loading2.json'),
            //       )
            //     :
            GetBuilder<GetFavArticlesController>(
          init: GetFavArticlesController(),
          builder: (controller) {
            if (controller.apiResponse.hasData) {
              return getFavArticleController.hasArticle == false
                  ? const Center(
                      child: Text("You have no favorite articles"),
                    )
                  : ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.articleList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.3),
                                    blurRadius: 7,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: whiteColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            child: ClipOval(
                                              child: Image.network(controller
                                                  .articleList[index]
                                                  .author!
                                                  .image
                                                  .toString()),
                                            ),
                                          ),
                                          Spacing.sizeBoxW_10(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.articleList[index]
                                                    .author!.username
                                                    .toString(),
                                                style: AppThemes
                                                    .textTheme.headline6,
                                              ),
                                              Text(
                                                  controller.articleList[index]
                                                      .createdAt
                                                      .toString(),
                                                  style: AppThemes
                                                      .textTheme.labelSmall)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          splashColor: primaryColor,
                                          onTap: () {
                                            (controller.articleList[index]
                                                        .favorited) ==
                                                    true
                                                ? favarticleController
                                                    .unlikeArticle(controller
                                                        .articleList[index].slug
                                                        .toString())
                                                : favarticleController
                                                    .likeArticle(controller
                                                        .articleList[index].slug
                                                        .toString());

                                            controller.getFavArticlesByUser(
                                                controller.offset);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: (controller
                                                        .articleList[index]
                                                        .favorited) ==
                                                    true
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: primaryColor,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color: primaryColor,
                                                  ),
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .articleList[index].favoritesCount
                                              .toString(),
                                          style: AppThemes.textTheme.headline6,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    getSingleArticleBySlugController
                                        .getSelectedArticle(controller
                                            .articleList[index].slug
                                            .toString());
                                    Get.toNamed(
                                      '/ArticleDetail',
                                      arguments:
                                          controller.articleList[index].slug,
                                    );
                                  },
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.articleList[index].title
                                              .toString(),
                                          style:
                                              AppThemes.textTheme.labelMedium,
                                        ),
                                        Text(
                                          controller
                                              .articleList[index].description
                                              .toString(),
                                          style: AppThemes.textTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacing.sizeBoxH_15(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Readmore....',
                                      style: AppThemes.textTheme.caption,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8.0,
                                            mainAxisSpacing: 8.0,
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    (MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.2),
                                          ),
                                          itemCount: controller
                                              .articleList[index]
                                              .tagList!
                                              .length,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: grey400,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text(controller
                                                  .articleList[index]
                                                  .tagList![i]),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            } else if (controller.apiResponse.hasError) {
              return Center(
                child: ErrorView(
                  title: NetworkException.getErrorMessage(
                      controller.apiResponse.error),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(8, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ShimmerWidget.rounded(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 5),
                    );
                  }),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
