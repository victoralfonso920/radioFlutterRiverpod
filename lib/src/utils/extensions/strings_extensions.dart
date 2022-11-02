import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

extension StringExtensions on String {
  /// Returns `true` if this nullable char sequence is either `null` or empty.
  bool isNullOrEmpty() {
    return isEmptyOrNull;
  }

  /// Returns `false` if this nullable char sequence is either `null` or empty.
  bool isNotNullOrEmpty() {
    return isNotEmpty;
  }

  /// Returns the value of this number as an [int]
  int toInt() => int.parse(this);

  /// Returns the value of this number as an [int] or null if can not be parsed.
  int? toIntOrNull() {
    return int.tryParse(this);
  }

  /// Returns the value of this number as an [double]
  double toDouble() => double.parse(this);

  /// Returns the value of this number as an [double] or null if can not be parsed.
  double? toDoubleOrNull() {
    return double.tryParse(this);
  }

  /// Returns true if 'this' is "true", otherwise - false
  bool toBoolean() => toLowerCase() == "true";

  /// Returns `true` if strings are equals without matching case
  bool equalsIgnoreCase(String? other) =>
          (other != null &&
              toLowerCase() == other.toLowerCase());

  /// Returns `true` if string contains another without matching case
  bool containsIgnoreCase(String? other) {
    if (other == null) return false;
    return toLowerCase().contains(other.toLowerCase());
  }

  /// Checks if string is Currency.
  bool isCurrency(String s) => hasMatch(s,
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  /// Checks if string is phone number.
  bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 8) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// Checks if string is email.
  bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is an html file.
  bool isHTML(String filePath) {
    return filePath.toLowerCase().endsWith(".html");
  }

  /// Checks if string is an video file.
  bool isVideo(String filePath) {
    var ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  /// Checks if string is an audio file.
  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  /// Checks if string is an image file.
  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  // Check if the string has any number in it, not accepting double, so don't
  // use "."
  isNumericOnly(String s) => hasMatch(s, r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool isAlphabetOnly(String s) => hasMatch(s, r'^[a-zA-Z]+$');

  /// Checks if string contains at least one Capital Letter
  bool hasCapitalletter(String s) => hasMatch(s, r'[A-Z]');

  bool validateEmail() {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  /// Returns a String without white space at all
  /// "hello world" // helloworld
  String? removeSpace() => isEmptyOrNull ? null : replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Return a bool if the string is null or empty
  bool get isEmptyOrNull =>   isEmpty;

  Color toColor() {
    try {
      var hexColor = replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      if (hexColor.length == 8) {
        return Color(int.parse("0x$hexColor"));
      }
      return Colors.white;
    } catch (e) {
      return Colors.white;
    }
  }

  String format(var arguments) => sprintf(this, arguments);
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');

  //Return the text received by param if String is empty
  String ifEmpty(String text) => isEmpty ? text : this;

  //Return the initials of a string
  String getInitials() => isNotEmpty
      ? trim().split(RegExp(' +')).map((s) => s[0]).take(2).join().toUpperCase()
      : '';


}
