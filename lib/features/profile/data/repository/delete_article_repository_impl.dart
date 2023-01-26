import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/data/source/remote/delete_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/delete_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DeleteArticleRepositoryImpl implements DeleteArticleRepository {
  DeleteArticleRemoteDataSource deleteArticleRemoteDataSource;
  DeleteArticleRepositoryImpl({required this.deleteArticleRemoteDataSource});
  @override
  deleteArticle(String slug) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        // final response =
        await deleteArticleRemoteDataSource.deleteSelectedArticle(slug);

        // var data = jsonDecode(response.toString());

        // print('This is response after deleting article $response');
        // return response;
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
