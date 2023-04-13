import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> launchInBrowser(url) async {
  final Uri urlFinal = Uri.parse(url);
  try {
    if (!await launchUrl(urlFinal)) {
      throw Exception('Could not launch $urlFinal');
    }
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }

  return true;
}
