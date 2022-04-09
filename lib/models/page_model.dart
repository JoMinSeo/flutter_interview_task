import 'package:flutter_interview_task/models/todo_model.dart';

class PageData {
  PageData({
    required this.pageName,
    required this.items,
  });

  String pageName;
  List<Todo> items;
}