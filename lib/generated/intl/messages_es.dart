// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static m0(min, max) => "Entre ${min} y ${max} kWh";

  static m1(min) => "Más de ${min} kWh";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "company_name" : MessageLookupByLibrary.simpleMessage("Fundación Agreste"),
    "footprint_1_energy_consumption_range" : m0,
    "footprint_1_energy_consumption_range_no_max" : m1,
    "footprint_1_next_button" : MessageLookupByLibrary.simpleMessage("Continuar"),
    "footprint_1_title" : MessageLookupByLibrary.simpleMessage("Consumo de energía"),
    "footprint_no_stats" : MessageLookupByLibrary.simpleMessage("Aquí aparecerán tus estadísticas una vez calcules tu huella"),
    "menu_tooltip" : MessageLookupByLibrary.simpleMessage("Menu"),
    "screen_name_about" : MessageLookupByLibrary.simpleMessage("Contacto & FAQ"),
    "screen_name_footprint" : MessageLookupByLibrary.simpleMessage("Calcula tu huella"),
    "screen_name_game" : MessageLookupByLibrary.simpleMessage("Juego"),
    "screen_name_profile" : MessageLookupByLibrary.simpleMessage("Mi perfil"),
    "screen_name_shop" : MessageLookupByLibrary.simpleMessage("Tienda"),
    "screen_name_tips" : MessageLookupByLibrary.simpleMessage("Consejos")
  };
}
