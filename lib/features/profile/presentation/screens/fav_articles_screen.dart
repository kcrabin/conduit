import 'package:conduit/features/profile/presentation/controllers/fav_articles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/app_themes.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/utils/spacing.dart';
import '../../../home/presentation/controllers/like_unlike_article_controller.dart';

class MyFavArticles extends StatelessWidget {
  const MyFavArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final favarticleController = Get.find<FavoriteArticleController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'My Articles',
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
        body: SingleChildScrollView(
            child: GetBuilder<GetFavArticlesController>(
                init: GetFavArticlesController(),
                builder: (controller) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.articleList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primaryColor2)),
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

                                            controller.getFavArticlesByUser();
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
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: primaryColor,
                                                  )
                                                : Icon(
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
                                    Get.toNamed(
                                      '/favArticleDetail',
                                      arguments: controller.articleList[index],
                                    );
                                  },
                                  child: SizedBox(
                                    child: Column(
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
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 3 / 1,
                                                  crossAxisSpacing: 3,
                                                  mainAxisSpacing: 3),
                                          itemCount: controller
                                              .articleList[index]
                                              .tagList!
                                              .length,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              padding: EdgeInsets.all(3),
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
                      });
                })),
      ),
    );
  }
}
