import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../domain/core/interfaces/entities/source_model.dart';
import '../../../domain/core/interfaces/uses_cases/sources_use_case.dart';

class SourcesController extends GetxController {
  final SourcesUseCase _sourcesUsecase;
  List<Source> channel = <Source>[];
  final _sourceModel = Rx<SourceModel?>(null);
  final isLoading = RxBool(false);

  String category = Get.arguments;
  RxString sourceId = ''.obs;


  SourcesController(this._sourcesUsecase);

  Rx<SourceModel?> get sourceModel => _sourceModel;

  @override
  void onInit(){
    super.onInit();
    fetchSourcesByCategory(category);
  }

  Future<void> fetchSourcesByCategory(String categoryCode) async {
    try {
      isLoading.value = true;
      final sourcesResponse = await _sourcesUsecase.call(categoryCode);
      channel.addAll(sourcesResponse.sources!);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
