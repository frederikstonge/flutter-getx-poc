import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        final title = current?.location;
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    delegate.toNamed(Routes.HOME);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(title ?? ''),
            centerTitle: true,
          ),
          body: GetRouterOutlet(
            initialRoute: Routes.HOME,
          ),
        );
      },
    );
  }
}
