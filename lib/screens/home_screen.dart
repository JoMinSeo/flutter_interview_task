import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_task/models/item_model.dart';
import 'package:flutter_interview_task/models/page_model.dart';
import 'package:flutter_interview_task/provider/home_provider.dart';
import 'package:flutter_interview_task/widgets/custom_button.dart';
import 'package:flutter_interview_task/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFCFCFCF),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getColumns(homeProvider.pageList, homeProvider),
        ),
      ),
    );
  }

  List<Widget> getColumns(List<PageData> pages, HomeProvider homeProvider) {
    return pages
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(right: 40),
            child: SizedBox(
              width: 300,
              height: 400,
              child: Column(
                children: [
                  SizedBox(height: 40, child: Center(child: Text(e.pageName))),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var pageIndex = homeProvider.pageList.indexWhere(
                                  (element) => element.pageName == e.pageName);

                              return CustomListTile(
                                content: e.items[index].content,
                                onTextTap: () => showModifyDialog(
                                    context, homeProvider, e, e.items[index]),
                                leftVisible: pageIndex == 0 ? false : true,
                                rightVisible: pageIndex ==
                                        homeProvider.pageList.length - 1
                                    ? false
                                    : true,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 10),
                            itemCount: e.items.length,
                          ),
                          CustomButton(
                            iconData: Icons.add,
                            onTap: () =>
                                showAddDialog(context, homeProvider, e),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  showAddDialog(
    BuildContext context,
    HomeProvider homeProvider,
    PageData pageData,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text("Add Item"),
          content: TextField(controller: homeProvider.itemTextController),
          actions: [
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                homeProvider.itemTextController.text = "";
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("추가"),
              onPressed: () {
                homeProvider.add(
                    pageData,
                    Item(
                        idx: pageData.items.length + 1,
                        content: homeProvider.itemTextController.text));
                homeProvider.itemTextController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  showModifyDialog(
    BuildContext context,
    HomeProvider homeProvider,
    PageData pageData,
    Item currentTodo,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text("Modify Item"),
          content: TextField(controller: homeProvider.itemTextController),
          actions: [
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                homeProvider.itemTextController.text = "";
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("수정"),
              onPressed: () {
                homeProvider.modify(pageData, currentTodo.idx,
                    homeProvider.itemTextController.text);
                homeProvider.itemTextController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
