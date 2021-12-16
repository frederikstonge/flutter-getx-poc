import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("news");
  }
}
