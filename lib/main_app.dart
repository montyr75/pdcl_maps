@HtmlImport('main_app.html')
library pdcl_maps.lib.main_app;

import 'dart:html';

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/maps_icons.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_icon_item.dart';
import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/paper_tabs.dart';
import 'package:polymer_elements/google_map.dart';
import 'package:polymer_elements/google_map_directions.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement {

  @property
  String travelMode = "DRIVING";

  MainApp.created() : super.created();

  /// Called when main-app has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
//  ready() {
//    GoogleMap gMap = $['g-map'];
//    GoogleMapDirections dir = $['directions'];
//    gMap.addEventListener('api-load', (_) => dir.map = gMap.map);
//  }
}
