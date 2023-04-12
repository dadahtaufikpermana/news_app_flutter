import '../entities/news_model.dart';
import '../entities/source_model.dart';

abstract class CategoryRepository{
  Future<SourceModel> getListCategory();
}