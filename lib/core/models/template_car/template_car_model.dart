

import 'dart:io';

class TemplateCarModel {
  final String tempCarName;
  final String tempCarExterior;
  File? tempCarImg;

  TemplateCarModel({
    required this.tempCarName,
    required this.tempCarExterior,
    this.tempCarImg,
  });
}
