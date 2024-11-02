import 'package:flutter/material.dart';

@immutable
final class AssetConstants {
  static AssetIcons icons = AssetIcons();
  static AssetImages images = AssetImages();
  static String toLotti(String name) => 'assets/lottie/$name.json';
  static String toJpg(String name) => 'assets/images/$name.jpg';
  static String toJpeg(String name) => 'assets/images/$name.jpeg';
  static String toPng(String name) => 'assets/images/$name.png';
  static String toIcon(String name) => 'assets/icons/ic_$name.svg';
  static String toJson(String name) => 'assets/mock/$name.json';
}

@immutable
final class AssetIcons {
  final String audio = AssetConstants.toIcon("audio_icon");
  final String google = AssetConstants.toIcon("google_icon");
}

@immutable
final class AssetImages {
  final String authBackground = AssetConstants.toPng("logo");
}
