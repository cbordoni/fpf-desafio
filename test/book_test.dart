import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:fpf_flutter/models/book.dart';

void main() {
  group('Book', () {
    test('should parse json as book', () {
      final json = jsonDecode("""
          {
            "title": "consequatur",
            "subtitle": "Sed amet dolor qui asperiores sunt saepe rerum.",
            "text": "Eum est voluptatem ut reiciendis. Ea quidem eos officia omnis nemo ab vel dolor officia. Quibusdam eum labore nobis tempora qui et. Id ut magnam. Non consectetur in nisi nisi aliquid voluptates in quisquam.",
            "id": "1"
          }
        """);

      final book = Book.fromJson(json);

      expect(book.id, 1);
    });
  });
}
