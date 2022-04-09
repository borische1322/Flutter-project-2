import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    //final path = await _localPath;
    //print(path);

    return File("/Users/borisswiftie/Desktop/flutter_learn/app/notes/assets/saves/counter.txt");
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsStringSync();

      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;

    return file.writeAsString(counter);
  }
}
