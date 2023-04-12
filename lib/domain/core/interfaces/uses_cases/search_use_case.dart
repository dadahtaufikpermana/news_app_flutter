import '../entities/news_model.dart';
import '../repositories/article_repository.dart';

class SearchArticleUseCase{
  final ArticleRepository _articleRepository;

  SearchArticleUseCase(this._articleRepository);

  Future<NewsModel> call(keyword){
    return _articleRepository.getListSearchArticle(keyword);
  }

}