import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/features/profile/presentation/controllers/delete_comment_controller.dart';
import 'package:conduit/features/profile/presentation/controllers/get_all_comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/data/source/remote/network_exception.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/error_view.dart';
import '../../../navigation/presentation/controller/navigation_controller.dart';

class CommentScreen extends StatelessWidget {
  final String slug;
  const CommentScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final deleteCommentController = Get.find<DeleteCommentController>();

    // print('this is slug from comment screen --- $slug');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: primaryColor,
              )),
          backgroundColor: Colors.transparent,
          title: Text(
            'Comment Screen',
            style: AppThemes.textTheme.titleLarge,
          ),
        ),
        body: GetBuilder<GetAllCommentController>(
          builder: (controller) {
            if (controller.apiResponse.hasData) {
              return SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.apiResponse.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.3),
                                    blurRadius: 5,
                                  )
                                ],
                                color: primaryColorLight,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: primaryColor)),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width,
                                    color: whiteColor,
                                    child: Text(controller
                                        .apiResponse.data[index].body
                                        .toString())),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  // padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: CircleAvatar(
                                              // backgroundColor: backgroundDark,
                                              radius: 20,
                                              child: Image.network(controller
                                                  .apiResponse
                                                  .data[index]
                                                  .author!
                                                  .image
                                                  .toString()),
                                            ),
                                          ),
                                          Spacing.sizeBoxW_10(),
                                          Column(
                                            children: [
                                              Text(
                                                controller
                                                    .apiResponse
                                                    .data[index]
                                                    .author
                                                    .username,
                                                style: AppThemes
                                                    .textTheme.subtitle2,
                                              ),
                                              Text(
                                                controller.apiResponse
                                                    .data[index].createdAt,
                                                style: AppThemes
                                                    .textTheme.overline,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      controller.apiResponse.data[index].author
                                                  .username ==
                                              navigationController.username
                                          ? IconButton(
                                              onPressed: () {
                                                deleteCommentController
                                                    .deleteSelectedComment(
                                                        slug,
                                                        controller.apiResponse
                                                            .data[index].id
                                                            .toString());

                                                controller.getAllComments(slug);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: deleteColor,
                                              ))
                                          : SizedBox()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
            } else if (controller.apiResponse.hasError) {
              return Center(
                child: ErrorView(
                  title: NetworkException.getErrorMessage(
                      controller.apiResponse.error),
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
