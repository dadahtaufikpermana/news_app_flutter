import '../entities/source_model.dart';
import '../repositories/category_repository.dart';
class CategoryUseCase{
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  Future<SourceModel> call(){
    return _categoryRepository.getListCategory();
  }

}