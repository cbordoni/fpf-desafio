import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/controllers/home_controller.dart';
import 'package:fpf_flutter/models/book.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  Widget getTile(Book item) {
    return ExpansionTile(title: Text(item.title), children: [
      ListTile(
        title: Text(item.subtitle),
      ),
      ListTile(
        title: Text(item.text),
      ),
    ]);
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

            return ListView.builder(
              itemCount: controller.books.length,
              itemBuilder: (context, index) {
                return getTile(controller.books[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
