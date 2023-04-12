import '../../../domain/core/interfaces/entities/source_model.dart';
import '../../../domain/core/interfaces/repositories/category_repository.dart';
import '../data sources/remote/remote_category_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final RemoteCategoryDataSource _remoteCategoryDataSource;

  CategoryRepositoryImpl(this._remoteCategoryDataSource);

  @override
  Future<SourceModel> getListCategory() {
    return _remoteCategoryDataSource.getCategory();
  }
}
