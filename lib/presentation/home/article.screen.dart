import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/presentation/home/web_view_screen.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../domain/core/interfaces/core/constants/constants.dart';
import '../controllers/ArticleController.dart';

class ArticleScreen extends GetView<ArticleController> {
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: const Color(0xFFF5C600),
      radius: BorderRadius.circular(30),
      key: controller.sideMenuKey,
      menu: sideDrawer(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5C600),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5C600),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              controller.toggleMenu();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: Text(
            Constants.news,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            GetBuilder<ArticleController>(
              builder: (controller) => Switch(
                value: controller.isSwitched == true,
                onChanged: (value) => controller.changeTheme(value),
                activeTrackColor: Colors.yellow,
                activeColor: Colors.red,
              ),
              init: controller,
            ),
          ],
        ),
        body: Obx(() {
          if (controller.notFound.value) {
            return Center(
                child: Text(Constants.notFound, style: TextStyle(fontSize: 30)));
          } else if (controller.news.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () => Get.to(
                          WebViewScreen(
                            newsUrl: controller.news[index].url,
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (controller.news[index].urlToImage != null)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Container(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      imageUrl:
                                          controller.news[index].urlToImage ??
                                              '',
                                    ),
                                  ),
                                SizedBox(height: 10),
                                Text(
                                  "${controller.news[index].source?.name ?? ''}",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${controller.news[index].title ?? ''}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]);
              },
              itemCount: controller.news.length,
            );
          }
        }),
      ),
    );
  }

  Widget sideDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFFF5C600),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 60),
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: Constants.findKeyword,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                scrollPadding: EdgeInsets.all(5),
                                onChanged: (val) {
                                  controller.findNews.value = val;
                                  controller.update();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text(Constants.find, style: TextStyle(fontSize: 18)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            onPressed: () async {
                              if (controller.findNews.value.isNotEmpty) {
                                controller
                                    .searchNews(controller.findNews.value);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
