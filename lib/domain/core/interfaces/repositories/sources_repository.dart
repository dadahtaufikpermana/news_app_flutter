import '../entities/news_model.dart';
import '../entities/source_model.dart';

abstract class SourcesRepository{
  Future<SourceModel> getListSourcesByCategory(String categoryCode);
}