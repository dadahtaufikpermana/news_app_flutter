import '../entities/source_model.dart';
import '../repositories/sources_repository.dart';

class SourcesUseCase{
  final SourcesRepository _sourcesRepository;

  SourcesUseCase(this._sourcesRepository);

  Future<SourceModel> call(String categoryCode){
    return _sourcesRepository.getListSourcesByCategory(categoryCode);
  }

}