/// Foydalanuvchidan so’z so'rang va ushbu so’z palindrommi yoki yo'qligini
/// chop eting.
/// Palindrom - oldinga va orqaga bir xil o'qiydigan so’z.
/// Misol uchun kiyik teskarisiga ham kiyik
library;

import 'dart:io';

void main() {
  stdout.write('Enter word: ');

  /// Get input word form the User
  final word = stdin.readLineSync()!.trim().toLowerCase();

  /// Store the reversed form of the word
  dynamic reversedWord = [];
  for (int i = word.length - 1; i >= 0; i--) {
    reversedWord.add(word[i]);
  }
  reversedWord = reversedWord.join('');

  /// Check for Palindrome
  print("$word = ${word == reversedWord ? 'Palindrome' : 'Not Palindrome'}");
}
