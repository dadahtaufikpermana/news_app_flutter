import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import '../../../../domain/core/interfaces/core/constants/constants.dart';
import '../../../../domain/core/interfaces/entities/source_model.dart';

class RemoteCategoryDataSource {
  final _client = Get.find<GetConnect>();

  Future<SourceModel> getCategory() async {
    final response = await _client.get(
        '/top-headlines/sources?apiKey=${Constants.apiKey}',
        decoder: (data) => SourceModel.fromJson(data));

    if (!response.hasError) {
      return response.body!;
    } else {
      throw Get.snackbar('Error', response.statusCode.toString());
    }
  }
}
