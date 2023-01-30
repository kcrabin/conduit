import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/widgets/error_view.dart';
import 'package:conduit/features/home/presentation/controllers/get_all_article_controller.dart';
import 'package:conduit/features/home/presentation/controllers/get_single_article_by_slug_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
            IconButton(
                onPressed: () {
                  Get.toNamed("/notifications");
                },
                icon: const Icon(
                  Icons.notifications,
                  color: primaryColor2,
                  size: 30,
                )),
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
                child:
                    //  articleController.isLoading == true
                    //     ? Center(
                    //         child: Lottie.asset('assets/lottie/loading2.json'),
                    //       )
                    //     :
                    ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articleController.apiResponse.data.length,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: ClipOval(
                                          child: Image.network(articleController
                                              .apiResponse
                                              .data[index]
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
                                            articleController.apiResponse
                                                .data[index].author!.username
                                                .toString(),
                                            style:
                                                AppThemes.textTheme.headline6,
                                          ),
                                          Text(
                                              articleController.apiResponse
                                                  .data[index].createdAt
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
                                        (articleController.apiResponse
                                                    .data[index].favorited) ==
                                                true
                                            ? favarticleController
                                                .unlikeArticle(articleController
                                                    .apiResponse
                                                    .data[index]
                                                    .slug
                                                    .toString())
                                            : favarticleController.likeArticle(
                                                articleController.apiResponse
                                                    .data[index].slug
                                                    .toString());

                                        articleController.fetchAllArticles();
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
                                        child: (articleController.apiResponse
                                                    .data[index].favorited) ==
                                                true
                                            ? const Icon(
                                                Icons.favorite,
                                                color: primaryColor,
                                              )
                                            : const Icon(
                                                Icons.favorite_border_outlined,
                                                color: primaryColor,
                                              ),
                                      ),
                                    ),
                                    Text(
                                      articleController.apiResponse.data[index]
                                          .favoritesCount
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
                                        .apiResponse.data[index].slug
                                        .toString());
                                Get.toNamed(
                                  '/ArticleDetail',
                                  arguments: articleController
                                      .apiResponse.data[index].slug,
                                );
                              },
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      articleController
                                          .apiResponse.data[index].title
                                          .toString(),
                                      style: AppThemes.textTheme.labelMedium,
                                    ),
                                    Text(
                                      articleController
                                          .apiResponse.data[index].description
                                          .toString(),
                                      style: AppThemes.textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacing.sizeBoxH_15(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Readmore....',
                                  style: AppThemes.textTheme.caption,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 3 / 1,
                                              crossAxisSpacing: 3,
                                              mainAxisSpacing: 3),
                                      itemCount: articleController.apiResponse
                                          .data[index].tagList!.length,
                                      itemBuilder: (context, i) {
                                        return Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: grey400,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(articleController
                                              .apiResponse
                                              .data[index]
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
              );
            } else if (articleController.apiResponse.hasError) {
              return Center(
                child: ErrorView(
                  title: NetworkException.getErrorMessage(
                      articleController.apiResponse.error),
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
