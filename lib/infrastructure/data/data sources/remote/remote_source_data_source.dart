import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import '../../../../domain/core/interfaces/core/constants/constants.dart';
import '../../../../domain/core/interfaces/entities/source_model.dart';

class RemoteSourceDataSource {
  final _client = Get.find<GetConnect>();

  Future<SourceModel> getSourcesByCategory(String categoryCode) async {
    final response = await _client.get(
      '/top-headlines/sources?category=$categoryCode&apiKey=${Constants.apiKey}',
      decoder: (data) => SourceModel.fromJson(data),
    );

    if (!response.hasError) {
      return response.body!;
    } else {
      throw Get.snackbar('Error', response.statusCode.toString());
    }
  }
}
