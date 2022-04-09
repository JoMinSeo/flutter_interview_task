import 'package:flutter_interview_task/models/item_model.dart';

class PageData {
  PageData({
    required this.pageName,
    required this.items,
  });

  String pageName;
  List<Item> items;
}