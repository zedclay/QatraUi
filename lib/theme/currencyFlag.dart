import 'package:flutter/material.dart';

class CurrencyFlag {
  final String currencyCode;

  final String imagePath;

  CurrencyFlag({
    required this.currencyCode,
    required this.imagePath,
  });
}

class CurrenciesFlag {
  static List<CurrencyFlag> currencies = [
    CurrencyFlag(
      currencyCode: "DZD",
      imagePath: 'assets/images/dzd2.png',
    ),
    CurrencyFlag(
      currencyCode: "USD",
      imagePath: 'assets/images/usa.png',
    ),
    CurrencyFlag(
      currencyCode: "CAD",
      imagePath: 'assets/images/canada.png',
    ),
    CurrencyFlag(
      currencyCode: "EUR",
      imagePath: 'assets/images/eur.png',
    ),
  ];
}
