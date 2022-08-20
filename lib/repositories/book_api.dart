import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/models/book.dart';

class BookApi extends GetConnect {
  Future<List<Book>> fetchBooks() async {
    final response = await get(
        'https://62507208977373573f3d77f0.mockapi.io/api/lib/library');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      List<Book> books = [];

      debugPrint('Got response');

      response.body.forEach((item) {
        books.add(Book.fromJson(item));
      });

      return books;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load books');
    }
  }
}
