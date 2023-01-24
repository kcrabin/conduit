import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/features/home/presentation/controllers/comment_controller.dart';
import 'package:conduit/features/home/presentation/controllers/like_unlike_article_controller.dart';
import 'package:conduit/features/profile/presentation/controllers/fav_articles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/utils/spacing.dart';
import '../../../data/models/response/fav_article_response_model.dart';

class FavArticleDetailScreen extends StatelessWidget {
  final Articles articles;
  const FavArticleDetailScreen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final favoriteArticleController = Get.find<FavoriteArticleController>();
    final addCommentController = Get.find<CommentController>();

    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(title: Text(articles.favorited.toString())),
          body: SingleChildScrollView(
        child: GetBuilder<GetFavArticlesController>(
            init: GetFavArticlesController(),
            builder: (controller) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                    color: backgroundDark,
                    child: Column(
                      children: [
                        Text(
                          articles.title.toString(),
                          style: AppThemes.textTheme.headline5,
                        ),
                        Spacing.sizeBoxH_10(),
                        InkWell(
                          onTap: () {
                            // print('ontap clicked');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: ClipOval(
                                      child: Image.network(
                                          articles.author!.image.toString()),
                                    ),
                                  ),
                                  Spacing.sizeBoxW_10(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        articles.author!.username.toString(),
                                        style: AppThemes.textTheme.headline6,
                                      ),
                                      Text(articles.createdAt.toString(),
                                          style: AppThemes.textTheme.headline2)
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacing.sizeBoxH_10(),
                        InkWell(
                          onTap: () {
                            print('ontap clicked');
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: whiteColor)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        'Follow ${articles.author!.username.toString()}',
                                        style: AppThemes.textTheme.headline2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Spacing.sizeBoxW_5(),
                              Expanded(
                                child: InkWell(
                                  splashColor: primaryColor,
                                  onTap: () {
                                    articles.favorited == true
                                        ? favoriteArticleController
                                            .unlikeArticle(
                                                articles.slug.toString())
                                        : favoriteArticleController.likeArticle(
                                            articles.slug.toString());

                                    controller.getFavArticlesByUser();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: articles.favorited == true
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: whiteColor)),
                                    child: articles.favorited == true
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                color: favColor,
                                              ),
                                              Text(
                                                'Unfavorite Article (${articles.favoritesCount.toString()})',
                                                style: AppThemes
                                                    .textTheme.headline2,
                                              )
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Icon(
                                                Icons.favorite_outline,
                                                color: favColor,
                                              ),
                                              Text(
                                                'Favourite Article (${articles.favoritesCount.toString()})',
                                                style: AppThemes
                                                    .textTheme.headline2,
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacing.sizeBoxH_15(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          articles.body.toString(),
                          style: AppThemes.textTheme.bodyText1,
                        ),
                        Divider(
                          color: dividerColor,
                          thickness: 1.5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: captionColor,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: primaryColor)),
                          child: Column(
                            children: [
                              Container(
                                color: whiteColor,
                                child: TextField(
                                  maxLines: 5,
                                  controller:
                                      addCommentController.commentController,
                                  decoration: InputDecoration(
                                      // fillColor: whiteColor,
                                      focusColor: whiteColor,
                                      labelText: 'Write a comment'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: backgroundDark,
                                      radius: 20,
                                      child: Icon(
                                        Icons.person,
                                        color: primaryColor,
                                      ),
                                    ),
                                    CustomElevtedButton(
                                        onClicked: () {
                                          addCommentController.addComment(
                                              articles.slug.toString());
                                        },
                                        minSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                            40),
                                        name: 'Post Comment')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      )),
    );
  }
}
