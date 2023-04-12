import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:logger/logger.dart';
import '../../../../domain/core/interfaces/core/constants/constants.dart';
import '../../../../domain/core/interfaces/entities/news_model.dart';

class RemoteArticleDataSource {
  final _client = Get.find<GetConnect>();

  Future<NewsModel> getArticles(String sourceID) async {
    final response = await _client.get(
        '/everything?sources=$sourceID&apiKey=${Constants.apiKey}',
        decoder: (data) => NewsModel.fromJson(data));
    Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      return response.body!;
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  Future<NewsModel> getSearchArticles(String keyword) async {
    final response = await _client.get(
        '/everything?q=$keyword&apiKey=${Constants.apiKey}',
        decoder: (data) => NewsModel.fromJson(data));
    Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      return response.body!;
    } else {
      throw Exception('Failed to fetch articles');
    }
  }
}
