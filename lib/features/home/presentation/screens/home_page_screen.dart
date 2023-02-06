import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/widgets/custom_textbutton.dart';
import 'package:conduit/core/presentation/widgets/error_view.dart';
import 'package:conduit/features/home/presentation/controllers/get_all_article_controller.dart';
import 'package:conduit/features/home/presentation/controllers/get_single_article_by_slug_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/shimmer.dart';
import '../controllers/like_unlike_article_controller.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final articleController = Get.find<GetAllArticleController>();
    final favarticleController = Get.put(FavoriteArticleController());
    final getSingleArticleBySlugController =
        Get.put(GetSingleArticleBySlugController());
    // final navigationController = Get.find<NavigationController>();
    // final taglistController = Get.find<TagListController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Conduit',
            style: AppThemes.textTheme.headline4,
          ),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       Get.toNamed("/notifications");
            //     },
            //     icon: const Icon(
            //       Icons.notifications,
            //       color: primaryColor2,
            //       size: 30,
            //     )),
            TextButton(
                onPressed: () {
                  // taglistController.getAllTags();
                  Get.toNamed('/tagListScreen');
                },
                child: Text(
                  '#',
                  style: AppThemes.textTheme.headline4,
                ))
          ],
        ),
        body: GetBuilder<GetAllArticleController>(
          init: GetAllArticleController(),
          builder: (articleController) {
            if (articleController.apiResponse.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // controller: articleController.scrollController,
                      itemCount: articleController.articleList.length,
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
                                      splashColor: primaryColor,
                                      onTap: () {
                                        print('ontap clicked');
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            child: ClipOval(
                                              child: Image.network(
                                                  articleController
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
                                                articleController
                                                    .articleList[index]
                                                    .author!
                                                    .username
                                                    .toString(),
                                                style: AppThemes
                                                    .textTheme.headline6,
                                              ),
                                              Text(
                                                  articleController
                                                      .articleList[index]
                                                      .createdAt
                                                      .toString(),
                                                  style: AppThemes
                                                      .textTheme.bodyText2),
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
                                            (articleController
                                                        .articleList[index]
                                                        .favorited) ==
                                                    true
                                                ? favarticleController
                                                    .unlikeArticle(
                                                        articleController
                                                            .articleList[index]
                                                            .slug
                                                            .toString())
                                                : favarticleController
                                                    .likeArticle(
                                                        articleController
                                                            .articleList[index]
                                                            .slug
                                                            .toString());

                                            articleController
                                                .fetchAllArticlesAfterLike(
                                                    articleController
                                                        .articleList.length,
                                                    0);
                                            articleController.currentIndex =
                                                index;
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
                                            child: (articleController
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
                                          articleController
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
                                        .getSelectedArticle(articleController
                                            .articleList[index].slug
                                            .toString());
                                    articleController.articleList[index].author!
                                                .username
                                                .toString() ==
                                            articleController.username
                                        ? Get.toNamed(
                                            '/myArticleDetail',
                                            arguments: articleController
                                                .articleList[index].slug,
                                          )
                                        : Get.toNamed(
                                            '/ArticleDetail',
                                            arguments: articleController
                                                .articleList[index].slug,
                                          );
                                  },
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          articleController
                                              .articleList[index].title
                                              .toString(),
                                          style:
                                              AppThemes.textTheme.labelMedium,
                                        ),
                                        Text(
                                          articleController
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
                                    articleController.articleList[index]
                                                .tagList!.length ==
                                            0
                                        ? SizedBox()
                                        : SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: GridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
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
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2),
                                                ),
                                                itemCount: articleController
                                                    .articleList[index]
                                                    .tagList!
                                                    .length,
                                                itemBuilder: (context, i) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      color: grey400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: Text(
                                                        articleController
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
                    ),
                    Spacing.sizeBoxH_5(),
                    CustomTextButton(
                        onClicked: () {
                          articleController.loadMoreArticles();
                        },
                        text: 'Load more articles'),
                  ],
                ),
              );
            } else if (articleController.apiResponse.hasError) {
              return Center(
                child: Column(
                  children: [
                    ErrorView(
                      title: NetworkException.getErrorMessage(
                          articleController.apiResponse.error),
                    ),
                    Spacing.sizeBoxH_10(),
                    IconButton(
                        onPressed: () {
                          Get.toNamed('/splashScreen');
                        },
                        icon: Icon(Icons.refresh))
                  ],
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
