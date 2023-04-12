import 'package:news_app_flutter/domain/core/interfaces/entities/news_model.dart';
import 'package:news_app_flutter/domain/core/interfaces/repositories/article_repository.dart';
class ArticleUseCase{
  final ArticleRepository _articleRepository;

  ArticleUseCase(this._articleRepository);

  Future<NewsModel> call(String sourceID){
    return _articleRepository.getListArticle(sourceID);
  }

}