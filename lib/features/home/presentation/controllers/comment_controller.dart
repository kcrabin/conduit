import 'package:conduit/features/home/data/model/comment_model.dart';
import 'package:conduit/features/home/data/repository/comment_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/comment_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  TextEditingController commentController = TextEditingController();

  CommentRepositoryImpl commentRepositoryImpl = CommentRepositoryImpl(
      commentRemoteDataSource: Get.find<CommentRemoteDataSource>());

  late Comment1 comment1;

  late Comment comment;

  addComment(String slug) {
    comment1 = Comment1(body: commentController.text);

    comment = Comment(comment: comment1);

    commentRepositoryImpl.addComment(slug, comment);

    commentController.clear();
  }
}
