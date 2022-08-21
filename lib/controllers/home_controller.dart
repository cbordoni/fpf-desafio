import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/repositories/book_api.dart';
import 'package:fpf_flutter/models/book.dart';

class HomeController extends GetxController {
  List<Book> books = [];
  bool isRequestFailed = false;
  bool isLoading = true;
  bool isDarkMode = Get.isDarkMode;

  @override
  void onInit() {
    fetchBooks();

    super.onInit();
  }

  void fetchBooks() {
    debugPrint('fetchBooks()');

    isRequestFailed = false;
    isLoading = true;
    update();

    BookApi().fetchBooks().then((value) {
      books = value;
    }).catchError((error) {
      isRequestFailed = true;
    }).whenComplete(() {
      isLoading = false;
      update();
    });
  }
}
