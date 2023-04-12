import 'package:get/get.dart';
import 'package:news_app_flutter/domain/core/interfaces/repositories/sources_repository.dart';
import 'package:news_app_flutter/domain/core/interfaces/uses_cases/sources_use_case.dart';
import 'package:news_app_flutter/infrastructure/data/data%20sources/remote/remote_source_data_source.dart';
import '../../../infrastructure/data/repository/sources_repository_impl.dart';
import '../../controllers/sources_controller.dart';

class SourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteSourceDataSource>(() => RemoteSourceDataSource());
    Get.lazyPut<SourcesRepository>(
            () => SourcesRepositoryImpl(Get.find<RemoteSourceDataSource>()));
    Get.lazyPut<SourcesUseCase>(
            () => SourcesUseCase(Get.find<SourcesRepository>()));
    Get.lazyPut<SourcesController>(() => SourcesController(Get.find<SourcesUseCase>()));
  }
}
