import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/controllers/book_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget getTile(item) {
    return ListTile(
      title: Text(item.title),
      onTap: () {
        debugPrint('Oh no');
      },
    );
  }

  @override
  Widget build(context) {
    debugPrint('Building');

    return Scaffold(
        appBar: AppBar(title: const Text("FPF Desafio")),
        body: GetBuilder<BooksController>(
          init: BooksController(),
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: Text('Loading'));
            }

            return ListView.builder(
              itemCount: controller.books.length,
              prototypeItem: getTile(controller.books.first),
              itemBuilder: (context, index) {
                return getTile(controller.books[index]);
              },
            );
          },
        ));
  }
}
