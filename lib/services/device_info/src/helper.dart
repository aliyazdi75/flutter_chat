import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

const unknown = 'UNKNOWN';

abstract class DeviceInfoBase {
  Future<String> getPlatformId();

  Future<String> getPlatformName();

  Future<String> getPlatformFriendlyName();

  Future<String> getPlatformVersion();

  String getPlatformOS();
}

class DeviceInfoHelper implements DeviceInfoBase {
  late DeviceInfoPlugin deviceInfoPlugin;

  DeviceInfoHelper() {
    deviceInfoPlugin = DeviceInfoPlugin();
  }

  @override
  Future<String> getPlatformId() async {
    try {
      if (Platform.isAndroid) {
        final build = await deviceInfoPlugin.androidInfo;
        return build.id;
      } else if (Platform.isIOS) {
        final data = await deviceInfoPlugin.iosInfo;
        return data.identifierForVendor;
      } else {
        return unknown;
      }
    } on PlatformException {
      return unknown;
    }
  }

  @override
  Future<String> getPlatformName() async {
    try {
      if (Platform.isAndroid) {
        final build = await deviceInfoPlugin.androidInfo;
        return build.model;
      } else if (Platform.isIOS) {
        final data = await deviceInfoPlugin.iosInfo;
        return data.name;
      } else {
        return unknown;
      }
    } on PlatformException {
      return unknown;
    }
  }

  @override
  Future<String> getPlatformFriendlyName() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final build = await deviceInfoPlugin.androidInfo;
        return '${build.model}';
      } else if (Platform.isIOS) {
        final data = await deviceInfoPlugin.iosInfo;
        return '${data.model} ${data.utsname.machine}';
      } else {
        return unknown;
      }
    } on PlatformException {
      return unknown;
    }
  }

  @override
  Future<String> getPlatformVersion() async {
    try {
      if (Platform.isAndroid) {
        final build = await deviceInfoPlugin.androidInfo;
        return build.version.sdkInt.toString();
      } else if (Platform.isIOS) {
        final data = await deviceInfoPlugin.iosInfo;
        return data.systemVersion;
      } else {
        return unknown;
      }
    } on PlatformException {
      return unknown;
    }
  }

  @override
  String getPlatformOS() {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        return Platform.operatingSystem;
      } else {
        return 'Web';
      }
    } on PlatformException {
      return 'Web';
    }
  }
}
