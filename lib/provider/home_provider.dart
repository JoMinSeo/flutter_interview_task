import 'package:flutter/cupertino.dart';
import 'package:flutter_interview_task/models/todo_model.dart';
import 'package:flutter_interview_task/models/page_model.dart';

class HomeProvider extends ChangeNotifier {
  List<PageData> _pageList = [
    PageData(pageName: 'A', items: []),
    PageData(pageName: 'B', items: []),
    PageData(pageName: 'C', items: []),
    PageData(pageName: 'D', items: []),
  ];

  final TextEditingController _todoTextController = TextEditingController();

  TextEditingController get todoTextController => _todoTextController;

  List<PageData> get pageList => _pageList;

  set pageList(List<PageData> value) {
    _pageList = value;
  }

  void add(PageData pageData, Todo item) {
    pageData.items.add(item);
    notifyListeners();
  }

  void modify(PageData pageData, int idx, String content) {
    pageData.items[idx - 1].content = content;
    notifyListeners();
  }
}
