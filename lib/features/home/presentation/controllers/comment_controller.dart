import 'package:conduit/features/home/data/repository/comment_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/comment_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/request/comment_request_model.dart';

class CommentController extends GetxController {
  TextEditingController commentController = TextEditingController();

  CommentRepositoryImpl commentRepositoryImpl = CommentRepositoryImpl(
      commentRemoteDataSource: Get.find<CommentRemoteDataSource>());

  late Comment comment1;

  late CommentRequest comment;

  addComment(String slug) {
    comment1 = Comment(body: commentController.text);

    comment = CommentRequest(comment: comment1);

    commentRepositoryImpl.addComment(slug, comment);

    commentController.clear();
  }
}
