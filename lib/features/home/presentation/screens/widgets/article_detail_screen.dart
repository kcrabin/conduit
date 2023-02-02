import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/features/home/presentation/controllers/comment_controller.dart';
import 'package:conduit/features/home/presentation/controllers/follow_unfollow_controller.dart';
import 'package:conduit/features/home/presentation/controllers/get_single_article_by_slug_controller.dart';
import 'package:conduit/features/home/presentation/controllers/like_unlike_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/data/source/remote/network_exception.dart';
import '../../../../../core/presentation/utils/spacing.dart';
import '../../../../../core/presentation/widgets/custom_textbutton.dart';
import '../../../../../core/presentation/widgets/error_view.dart';
import '../../../../profile/presentation/controllers/get_all_comment_controller.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String slug;
  ArticleDetailScreen({super.key, required this.slug});

  // for this do by using get articles by slug

  @override
  Widget build(BuildContext context) {
    // final getSingleArticleBySlugController =
    //     Get.find<GetSingleArticleBySlugController>();
    final addCommentController = Get.find<CommentController>();
    final favController = Get.find<FavoriteArticleController>();
    final followController = Get.find<FollowUnfollowController>();
    // print(
    //     'printed from detail screen --${getSingleArticleBySlugController.article.body}');

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<GetSingleArticleBySlugController>(
          builder: (getSingleArticleBySlugController) {
            if (getSingleArticleBySlugController.apiResponse.hasData) {
              return SingleChildScrollView(
                child:
                    // getSingleArticleBySlugController.isLoading == true
                    //     ? Center(
                    //         child: Lottie.asset('assets/lottie/loading2.json'),
                    //       )
                    //     :
                    Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 6),
                      color: backgroundDark,
                      child: Column(
                        children: [
                          Text(
                            getSingleArticleBySlugController
                                .apiResponse.data.title
                                .toString(),
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
                                            getSingleArticleBySlugController
                                                .apiResponse.data.author!.image
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
                                              .apiResponse.data.author!.username
                                              .toString(),
                                          style: AppThemes.textTheme.headline6,
                                        ),
                                        Text(
                                            getSingleArticleBySlugController
                                                .apiResponse.data.createdAt
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
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: primaryColor,
                                  onTap: () {
                                    // print('ontap');
                                    getSingleArticleBySlugController.apiResponse
                                                .data.author.following ==
                                            true
                                        ? followController.requestUnfollow(
                                            getSingleArticleBySlugController
                                                .apiResponse
                                                .data
                                                .author
                                                .username
                                                .toString())
                                        : followController.requestFollow(
                                            getSingleArticleBySlugController
                                                .apiResponse
                                                .data
                                                .author
                                                .username
                                                .toString());

                                    getSingleArticleBySlugController
                                        .getSelectedArticle(
                                            getSingleArticleBySlugController
                                                .apiResponse.data.slug
                                                .toString());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: getSingleArticleBySlugController
                                                    .apiResponse
                                                    .data
                                                    .author
                                                    .following ==
                                                true
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: whiteColor)),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: whiteColor,
                                        ),
                                        getSingleArticleBySlugController
                                                    .apiResponse
                                                    .data
                                                    .author
                                                    .following ==
                                                true
                                            ? Text(
                                                'Unfollow ${getSingleArticleBySlugController.apiResponse.data.author!.username.toString()}',
                                                style: AppThemes
                                                    .textTheme.headline2,
                                              )
                                            : Text(
                                                'Follow ${getSingleArticleBySlugController.apiResponse.data.author!.username.toString()}',
                                                style: AppThemes
                                                    .textTheme.headline2,
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacing.sizeBoxW_5(),
                              Expanded(
                                child: InkWell(
                                  splashColor: primaryColor,
                                  onTap: () {
                                    getSingleArticleBySlugController
                                                .apiResponse.data.favorited ==
                                            true
                                        ? favController.unlikeArticle(
                                            getSingleArticleBySlugController
                                                .apiResponse.data.slug
                                                .toString())
                                        : favController.likeArticle(
                                            getSingleArticleBySlugController
                                                .apiResponse.data.slug
                                                .toString());

                                    getSingleArticleBySlugController
                                        .getSelectedArticle(
                                            getSingleArticleBySlugController
                                                .apiResponse.data.slug
                                                .toString());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: getSingleArticleBySlugController
                                                    .apiResponse
                                                    .data
                                                    .favorited ==
                                                true
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: whiteColor)),
                                    child: getSingleArticleBySlugController
                                                .apiResponse.data.favorited ==
                                            true
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                color: favColor,
                                              ),
                                              Text(
                                                'Unfavorite Article (${getSingleArticleBySlugController.apiResponse.data.favoritesCount.toString()})',
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
                                                'Favourite Article (${getSingleArticleBySlugController.apiResponse.data.favoritesCount.toString()})',
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
                        ],
                      ),
                    ),
                    // Spacing.sizeBoxH_15(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '${getSingleArticleBySlugController.apiResponse.data.body}',
                            style: AppThemes.textTheme.bodyText1,
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
                                    controller:
                                        addCommentController.commentController,
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
                                                    .apiResponse.data.slug
                                                    .toString());
                                          },
                                          minSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              40),
                                          name: 'Post Comment'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacing.sizeBoxH_10(),
                          CustomTextButton(
                              onClicked: () {
                                Get.put(GetAllCommentController())
                                    .getAllComments(
                                        getSingleArticleBySlugController
                                            .apiResponse.data.slug
                                            .toString());

                                Get.toNamed('/viewComments',
                                    arguments: getSingleArticleBySlugController
                                        .apiResponse.data.slug
                                        .toString());
                              },
                              text: "Tap to view all comments.")
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (getSingleArticleBySlugController.apiResponse.hasError) {
              return Center(
                child: ErrorView(
                  title: NetworkException.getErrorMessage(
                      getSingleArticleBySlugController.apiResponse.error),
                ),
              );
            } else {
              return Center(
                child: Lottie.asset('assets/lottie/loading2.json'),
              );
            }
          },
        ),
      ),
    );
  }
}
