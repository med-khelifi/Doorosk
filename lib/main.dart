import 'package:doorosk/app/doorosk.dart';
import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

Future<String?> getDeviceVersion() async {
  if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.release;
  }
  return null;
}

Future<String> getInitialRoute() async {
  String? deviceVersion = await getDeviceVersion();
  int version = int.tryParse(deviceVersion ?? "0") ?? 0;
  if (version < 12) {
    return RoutesNames.onboarding;
  }
  return RoutesNames.splash;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String route = await getInitialRoute();


  runApp(Doorosk(initialRoute: route));
}
