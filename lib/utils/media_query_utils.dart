import 'package:flutter/material.dart';

double getMediaQueryHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage;
}

double getMediaQueryWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}
