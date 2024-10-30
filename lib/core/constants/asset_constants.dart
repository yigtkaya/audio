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
  final String facebook = AssetConstants.toIcon("facebook_icon");
  final String google = AssetConstants.toIcon("google_icon");
  final String apple = AssetConstants.toIcon("apple_icon");
  final String images = AssetConstants.toIcon("images_icon");
  final String road = AssetConstants.toIcon("road");
  final String ilanlar = AssetConstants.toIcon("ilanlar");
  final String messages = AssetConstants.toIcon("messages");
  final String settings = AssetConstants.toIcon("settings");
  final String location = AssetConstants.toIcon("location");
  final String world = AssetConstants.toIcon("world");
  final String logOut = AssetConstants.toIcon("log_out");
  final String carJourney = AssetConstants.toIcon("car_journey");
  final String addTrip = AssetConstants.toIcon("add_trip");
  final String pictures = AssetConstants.toIcon("pictures");
  final String picturesFirst = AssetConstants.toIcon("pictures_first");
  final String hurryClock = AssetConstants.toIcon("hurry_clock");
  final String clock = AssetConstants.toIcon("clock");
  final String trip = AssetConstants.toIcon("trip");
  final String sort = AssetConstants.toIcon("sort");
  final String departurePoint = AssetConstants.toIcon("departure_point");
  final String destinationPoint = AssetConstants.toIcon("destination_point");
  final String verticalDivider = AssetConstants.toIcon("vertical_divider");
  final String paperPlane = AssetConstants.toIcon("paper_plane");
  final String userShield = AssetConstants.toIcon("user_shield");
  final String notification = AssetConstants.toIcon("notification");
  final String emptyStar = AssetConstants.toIcon("empty_star_icon");
  final String star = AssetConstants.toIcon("star_icon");
  final String review = AssetConstants.toIcon("review");
}

@immutable
final class AssetImages {
  final String cuteCatExample = AssetConstants.toPng("cute_cat_example");
  final String studentCard = AssetConstants.toPng("student_card");
}
