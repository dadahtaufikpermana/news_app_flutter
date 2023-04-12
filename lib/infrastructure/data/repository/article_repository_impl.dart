import 'package:news_app_flutter/domain/core/interfaces/repositories/article_repository.dart';

import '../../../domain/core/interfaces/entities/news_model.dart';
import '../data sources/remote/remote_article_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository{

  final RemoteArticleDataSource _remoteArticleDataSource;

  ArticleRepositoryImpl(this._remoteArticleDataSource);
  @override
  Future<NewsModel> getListArticle(String sourceID) {
    return _remoteArticleDataSource.getArticles(sourceID);
  }

  @override
  Future<NewsModel> getListSearchArticle(keyword) {
    return _remoteArticleDataSource.getSearchArticles(keyword);
  }

}