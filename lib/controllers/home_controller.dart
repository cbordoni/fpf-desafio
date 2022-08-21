import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/repositories/book_api.dart';
import 'package:fpf_flutter/models/book.dart';

class HomeController extends GetxController {
  List<Book> books = [];
  bool isLoading = true;

  @override
  void onInit() {
    fetchBooks();

    super.onInit();
  }

  void fetchBooks() {
    debugPrint('fetchBooks()');

    isLoading = true;
    update();

    BookApi().fetchBooks().then((value) {
      books = value;
    }).whenComplete(() {
      isLoading = false;
      update();
    });
  }
}
