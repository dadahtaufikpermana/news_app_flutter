import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../infrastructure/navigation/routes.dart';
import '../controllers/sources_controller.dart';

class SourcesScreen extends GetView<SourcesController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sources'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Obx(()=>
        controller.isLoading.value
        ? CircularProgressIndicator()
        : ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: controller.channel.length,
            itemBuilder: (context, index) {
              final source = controller.channel[index];
              return Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.article_outlined),
                  title: Text(source.name!),
                  subtitle: Text(source.description!),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // controller.sourceId.value = controller.sourceModel.value!.sources![index].id!;
                    Get.toNamed(Routes.ARTICLE, arguments: controller.channel[index].id);
                  },
                ),
              );
            },
          )
        ),
    );
  }
}
