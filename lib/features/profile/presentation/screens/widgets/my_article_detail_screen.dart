import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/features/home/presentation/controllers/comment_controller.dart';
import 'package:conduit/features/home/presentation/controllers/get_single_article_by_slug_controller.dart';
import 'package:conduit/features/home/presentation/controllers/like_unlike_article_controller.dart';
import 'package:conduit/features/profile/presentation/controllers/delete_article_controller.dart';
import 'package:conduit/features/profile/presentation/controllers/edit_article_controller.dart';
import 'package:conduit/features/profile/presentation/controllers/my_articles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/utils/spacing.dart';

class MyArticleDetailScreen extends StatelessWidget {
  final String slug;
  const MyArticleDetailScreen({super.key, required this.slug});

  // for this do by using get articles by slug

  @override
  Widget build(BuildContext context) {
    // final getSingleArticleBySlugController =
    //     Get.find<GetSingleArticleBySlugController>();
    final addCommentController = Get.find<CommentController>();
    final favController = Get.find<FavoriteArticleController>();
    final deleteArticleController = Get.find<DeleteArticleController>();
    final myArticleController = Get.put(MyArticleController());
    final editArticleController = Get.put(EditArticleController());
    // print(
    //     'printed from detail screen --${getSingleArticleBySlugController.article.body}');

    return GetBuilder<GetSingleArticleBySlugController>(
        builder: (getSingleArticleBySlugController) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: getSingleArticleBySlugController.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 6),
                        color: backgroundDark,
                        child: Column(
                          children: [
                            Text(
                              getSingleArticleBySlugController.article.title
                                  .toString(),
                              style: AppThemes.textTheme.headline5,
                            ),
                            Spacing.sizeBoxH_10(),
                            InkWell(
                              onTap: () {
                                // print('ontap clicked');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: ClipOval(
                                          child: Image.network(
                                              getSingleArticleBySlugController
                                                  .article.author!.image
                                                  .toString()),
                                        ),
                                      ),
                                      Spacing.sizeBoxW_10(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getSingleArticleBySlugController
                                                .article.author!.username
                                                .toString(),
                                            style:
                                                AppThemes.textTheme.headline6,
                                          ),
                                          Text(
                                              getSingleArticleBySlugController
                                                  .article.createdAt
                                                  .toString(),
                                              style:
                                                  AppThemes.textTheme.headline2)
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
                                // print('ontap clicked');
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: whiteColor)),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: primaryColor,
                                          ),
                                          Text(
                                            'Follow ${getSingleArticleBySlugController.article.author!.username.toString()}',
                                            style:
                                                AppThemes.textTheme.headline2,
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
                                        getSingleArticleBySlugController
                                                    .article.favorited ==
                                                true
                                            ? favController.unlikeArticle(
                                                getSingleArticleBySlugController
                                                    .article.slug
                                                    .toString())
                                            : favController.likeArticle(
                                                getSingleArticleBySlugController
                                                    .article.slug
                                                    .toString());

                                        getSingleArticleBySlugController
                                            .getSelectedArticle(
                                                getSingleArticleBySlugController
                                                    .article.slug
                                                    .toString());
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color:
                                                getSingleArticleBySlugController
                                                            .article
                                                            .favorited ==
                                                        true
                                                    ? primaryColor
                                                    : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: whiteColor)),
                                        child: getSingleArticleBySlugController
                                                    .article.favorited ==
                                                true
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Icons.favorite,
                                                    color: favColor,
                                                  ),
                                                  Text(
                                                    'Unfavorite Article (${getSingleArticleBySlugController.article.favoritesCount.toString()})',
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
                                                    'Favourite Article (${getSingleArticleBySlugController.article.favoritesCount.toString()})',
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
                              '${getSingleArticleBySlugController.article.body}',
                              style: AppThemes.textTheme.bodyText1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      deleteArticleController
                                          .requestDelete(slug);
                                      myArticleController.getArticleByUser();
                                      Get.back();

                                      // Get.toNamed("/myArticles");
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: deleteColor,
                                    )),
                                Spacing.sizeBoxW_10(),
                                IconButton(
                                    onPressed: () {
                                      editArticleController
                                              .titleController.text =
                                          getSingleArticleBySlugController
                                              .article.title!;
                                      editArticleController
                                              .descriptionController.text =
                                          getSingleArticleBySlugController
                                              .article.description!;
                                      editArticleController
                                              .bodyController.text =
                                          getSingleArticleBySlugController
                                              .article.body!;

                                      Get.toNamed("/editArticleScreen",
                                          arguments:
                                              getSingleArticleBySlugController
                                                  .article);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: editColor,
                                    ))
                              ],
                            ),
                            const Divider(
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
                                      controller: addCommentController
                                          .commentController,
                                      decoration: const InputDecoration(
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
                                        const CircleAvatar(
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
                                                  getSingleArticleBySlugController
                                                      .article.slug
                                                      .toString());
                                            },
                                            minSize: Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
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
                  ),
          ),
        ),
      );
    });
  }
}
