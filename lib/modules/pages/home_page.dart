import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/controllers/home_controller.dart';
import 'package:fpf_flutter/models/book.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  final controller = Get.put(HomeController());

  Widget getTile(Book item) {
    return ExpansionTile(
      title: Text(item.title.capitalizeFirst.toString()),
      childrenPadding: const EdgeInsets.only(bottom: 16.0),
      children: [
        ListTile(
          title: Text(item.subtitle),
        ),
        ListTile(
          title: Text(item.text),
        ),
      ],
    );
  }

  @override
  Widget build(context) {
    debugPrint('Building');

    return Scaffold(
      appBar: AppBar(title: const Text('FPF Desafio')),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchBooks();
        },
        child: GetBuilder<HomeController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.isRequestFailed) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Something is wrong :('),
                    TextButton(
                      onPressed: controller.fetchBooks,
                      child: const Text('Try again'),
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: controller.books.length,
              itemBuilder: (context, index) {
                return getTile(controller.books[index]);
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Dark Theme'),
              trailing: ObxValue(
                (data) => Switch(
                    value: data.value,
                    onChanged: (bool isDarkMode) async {
                      Get.changeThemeMode(
                          isDarkMode ? ThemeMode.dark : ThemeMode.light);

                      data(isDarkMode);
                    }),
                Get.isDarkMode.obs,
              ),
            )
          ],
        ),
      ),
    );
  }
}
