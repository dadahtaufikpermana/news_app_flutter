import '../../../domain/core/interfaces/entities/source_model.dart';
import '../../../domain/core/interfaces/repositories/sources_repository.dart';
import '../data sources/remote/remote_source_data_source.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  final RemoteSourceDataSource _remoteSourceDataSource;

  SourcesRepositoryImpl(this._remoteSourceDataSource);

  @override
  Future<SourceModel> getListSourcesByCategory(String categoryCode) {
    return _remoteSourceDataSource.getSourcesByCategory(categoryCode);
  }
}