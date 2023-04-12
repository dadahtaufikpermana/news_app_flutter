import 'package:get/get.dart';
import 'package:news_app_flutter/domain/core/interfaces/uses_cases/search_use_case.dart';
import '../../../domain/core/interfaces/repositories/article_repository.dart';
import '../../../domain/core/interfaces/uses_cases/article_use_case.dart';
import '../../../infrastructure/data/data sources/remote/remote_article_data_source.dart';
import '../../../infrastructure/data/repository/article_repository_impl.dart';
import '../../controllers/ArticleController.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteArticleDataSource>(() => RemoteArticleDataSource());
    Get.lazyPut<ArticleRepository>(
            () => ArticleRepositoryImpl(Get.find<RemoteArticleDataSource>()));
    Get.lazyPut<ArticleUseCase>(() => ArticleUseCase(Get.find<ArticleRepository>()));
    Get.lazyPut<SearchArticleUseCase>(() => SearchArticleUseCase(Get.find<ArticleRepository>()));
    Get.lazyPut<ArticleController>(() => ArticleController(
        Get.find<ArticleUseCase>(),
        Get.find<SearchArticleUseCase>()));
  }
}
