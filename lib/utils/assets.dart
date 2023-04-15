import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;


class AssetManager {

  // BuildContext ctx;

  // AssetManager(this.ctx);

  Future<String> load(String name) {
    return rootBundle.loadString(name);
  }
}
