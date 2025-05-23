import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

IconData getIconFromString(String iconName) {
  Map<String, IconData> iconMap = {
    "MaterialSymbols.directions_car": Symbols.directions_car,
    "MaterialSymbols.local_parking": Symbols.local_parking,
    "MaterialSymbols.ev_station": Symbols.ev_station,
    "MaterialSymbols.fingerprint": Symbols.fingerprint,
    "MaterialSymbols.person_add": Symbols.person_add,
    "MaterialSymbols.grid_on": Symbols.grid_on,
    "MaterialSymbols.recent_actors": Symbols.recent_actors,
    "MaterialSymbols.psychology_alt": Symbols.psychology_alt,
    "MaterialSymbols.diversity_1": Symbols.diversity_1,
    "MaterialSymbols.shopping_basket": Symbols.shopping_basket,
    "MaterialSymbols.book_online": Symbols.book_online,
    "MaterialSymbols.more_horiz": Symbols.more_horiz,
    "MaterialSymbols.desk": Symbols.desk,
    "MaterialSymbols.meeting_room": Symbols.meeting_room,
    "MaterialSymbols.airport_shuttle": Symbols.airport_shuttle,
    "MaterialSymbols.moped": Symbols.moped,
    "MaterialSymbols.fastfood": Symbols.fastfood,
    "MaterialSymbols.fitness_center": Symbols.fitness_center,
    "MaterialSymbols.directions_run": Symbols.directions_run,
    "MaterialSymbols.sports_esports": Symbols.sports_esports,
    "MaterialSymbols.coffee_maker": Symbols.coffee_maker,
    "MaterialSymbols.stethoscope": Symbols.stethoscope,
    "MaterialSymbols.psychology": Symbols.psychology,
    "MaterialSymbols.spa": Symbols.spa,
    "MaterialSymbols.local_taxi": Symbols.local_taxi,
    "MaterialSymbols.location_city": Symbols.location_city,
    "MaterialSymbols.check_in_out": Symbols.check_in_out,
    "MaterialSymbols.elevator": Symbols.elevator,
    "MaterialSymbols.apartment": Symbols.apartment,
    "MaterialSymbols.print_connect": Symbols.print_connect,
    "MaterialSymbols.flex_wrap": Symbols.flex_wrap,
    "MaterialSymbols.event": Symbols.event,
    "MaterialSymbols.mood": Symbols.mood,
  };

  return iconMap[iconName] ?? Icons.help; // Default to a help icon if not found
}
