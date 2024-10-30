import 'package:flutter/material.dart';
import 'package:audio/localization/helper/models/language.dart';

const Language turkish = Language(
  id: 0,
  name: 'Türkçe',
  imagePath: "AssetConstants.imgTurkeyFlag",
  urlCode: 'tr',
  locale: Locale('tr'),
  currency: turkishCurrency,
);

const Currency turkishCurrency = Currency(
  code: 784,
  name: 'Turkish Lira',
  shortName: 'TL',
  symbol: '₺',
);
