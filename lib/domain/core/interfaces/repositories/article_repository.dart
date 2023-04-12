import '../entities/news_model.dart';

abstract class ArticleRepository{
  Future<NewsModel> getListArticle(String sourceID);

  Future<NewsModel> getListSearchArticle(keyword);
}