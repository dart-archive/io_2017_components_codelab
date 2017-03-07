// Copyright (c) 2017, filiph. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'hello_dialog/hello_dialog.dart';

import 'package:english_words/english_words.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, HelloDialog],
  providers: const [materialProviders],
)
class AppComponent {
  List<WordPair> names = [];

  Set<WordPair> savedNames = new Set<WordPair>();

  void recreate() {
    names = generateCombo().take(5).toList();
  }

  void add(WordPair name) {
    savedNames.add(name);
    names.remove(name);
  }

  void remove(WordPair name) {
    savedNames.remove(name);
    names.add(name);
  }
}
