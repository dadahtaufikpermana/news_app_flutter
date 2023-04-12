import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../../../domain/core/interfaces/entities/news_model.dart';
import '../../../domain/core/interfaces/uses_cases/article_use_case.dart';
import '../../../domain/core/interfaces/uses_cases/search_use_case.dart';

class ArticleController extends GetxController {
  GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  List<Article> news = <Article>[];
  ScrollController scrollController = ScrollController();
  RxBool notFound = false.obs;
  RxBool isLoading = false.obs;
  RxString cName = ''.obs;
  RxString country = ''.obs;
  RxString category = ''.obs;
  RxString findNews = ''.obs;
  RxInt pageNum = 1.obs;
  dynamic isSwitched = false.obs;
  dynamic isPageLoading = false.obs;
  RxInt pageSize = 10.obs;
  String baseApi = "https://newsapi.org/v2/top-headlines?";
  final ArticleUseCase _articleUseCase;
  final SearchArticleUseCase _searchArticleUseCase;

  final sourceId = Get.arguments;


  ArticleController(this._articleUseCase, this._searchArticleUseCase);

  @override
  void onInit() {
    scrollController = new ScrollController()..addListener(_scrollListener);
    super.onInit();
    getListArticle(sourceId);
  }

  changeTheme(value) {
    Get.changeTheme(value == true ? ThemeData.dark() : ThemeData.light());
    isSwitched = value;
    update();
    findNews.value = '';
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
    }
  }
  void toggleMenu() {
    if (sideMenuKey.currentState!.isOpened) {
      sideMenuKey.currentState!.closeSideMenu();
    } else {
      sideMenuKey.currentState!.openSideMenu();
    }
  }

  void getListArticle(String sourceID) async {
    try {
      isLoading.toggle();
      final articleResponse = await _articleUseCase.call(sourceID);
      news.addAll(articleResponse.articles!);
      isLoading.toggle();
      update();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void searchNews(String keyword) async {
    try {
      isLoading.toggle();
      final articleResponse = await _searchArticleUseCase.call(keyword);
      news.clear();
      if (articleResponse.articles!.isEmpty) {
        notFound.value = true;
      } else {
        news.addAll(articleResponse.articles!);
        notFound.value = false;
      }
      isLoading.toggle();
      update();
    } catch (e) {
      isLoading.toggle();
      Get.snackbar("Error", e.toString());
    }
  }
}
