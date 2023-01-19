import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/features/home/presentation/controllers/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final articleController = Get.find<ArticleController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'Conduit',
            style: AppThemes.textTheme.headline4,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         articleController.fetchAllArticles();
          //       },
          //       icon: Icon(
          //         Icons.print,
          //         color: Colors.black,
          //       )),
          // ],
        ),
        body: SingleChildScrollView(
            child: GetBuilder<ArticleController>(
                init: ArticleController(),
                builder: (context) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: articleController.articleList.length,
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
                                          ClipOval(
                                            child: Image.network(
                                                articleController
                                                    .articleList[index]
                                                    .author!
                                                    .image
                                                    .toString()),
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
                                          onTap: () {},
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: primaryColor)),
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: primaryColor2,
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
                                    Get.toNamed(
                                      '/ArticleDetail',
                                      arguments:
                                          articleController.articleList[index],
                                    );
                                  },
                                  child: SizedBox(
                                    child: Column(
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
                                          itemCount: articleController
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
                                              child: Text(articleController
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
