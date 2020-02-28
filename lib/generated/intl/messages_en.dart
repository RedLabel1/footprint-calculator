// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(min, max) => "${min} to ${max} kWh";

  static m1(min) => "${min} kWh or more";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "company_name" : MessageLookupByLibrary.simpleMessage("Agreste foundation"),
    "footprint_1_energy_consumption_range" : m0,
    "footprint_1_energy_consumption_range_no_max" : m1,
    "footprint_1_next_button" : MessageLookupByLibrary.simpleMessage("Next"),
    "footprint_1_title" : MessageLookupByLibrary.simpleMessage("Energy consumption"),
    "footprint_no_stats" : MessageLookupByLibrary.simpleMessage("Once you complete your footprint calculations, you will find your stats here"),
    "menu_tooltip" : MessageLookupByLibrary.simpleMessage("Menu"),
    "screen_name_about" : MessageLookupByLibrary.simpleMessage("Contact & FAQ"),
    "screen_name_footprint" : MessageLookupByLibrary.simpleMessage("Calculate your footprint"),
    "screen_name_game" : MessageLookupByLibrary.simpleMessage("Game"),
    "screen_name_profile" : MessageLookupByLibrary.simpleMessage("My profile"),
    "screen_name_shop" : MessageLookupByLibrary.simpleMessage("Shop"),
    "screen_name_tips" : MessageLookupByLibrary.simpleMessage("Tips")
  };
}
