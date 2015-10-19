#Polymer Dart Code Lab: Google Maps

###START
1. Create new Polymer web project.
2. **index.dart**: `import 'package:polymer_elements/iron_flex_layout.dart';`
3. `<body>`: `class="fullbleed"`
4. `<main-app>`: `class="fit"`
5. **main_app.dart**: `import 'package:polymer_elements/google_map.dart';`
6. **main_app.html**: `<google-map id="g-map" latitude="40.2735697" longitude="-111.7154958" zoom="13"></google-map>`
7. Run: Map of SF should fill display, with SBDC centered.

###ADD MARKER
1. `<google-map>`: `disable-default-ui`
2. `<google-map>`: `<google-map-marker latitude="40.2735697" longitude="-111.7154958" title="GDG Utah Dart Meetup&#13;Orem, Utah&#13;USA" draggable="true"></google-map-marker>`
3. Run: Map controls are gone and SBDC marker is in place.

###DIRECTIONS
1. **main_app.dart**: `import 'package:polymer_elements/google_map_directions.dart';`
2. `<google-map>`: `libraries="places"`
3. **main_app.html**: `<google-map-directions id="directions" start-address="Orem" end-address="SLC" libraries="places"></google-map-directions>`
4. **main_app.dart**:

        ready() {
          GoogleMap gMap = $['g-map'];
          GoogleMapDirections dir = $['directions'];
          gMap.addEventListener('api-load', (_) => dir.map = gMap.map);
        }

5. Run: Route from Orem to SLC is highlighted.

###ADDRESS INPUTS
1. **main_app.dart**:

        import 'package:polymer_elements/iron_icons.dart';
        import 'package:polymer_elements/iron_icon.dart';
        import 'package:polymer_elements/paper_item.dart';
        import 'package:polymer_elements/paper_icon_item.dart';
        import 'package:polymer_elements/paper_input.dart';
        import 'package:polymer_elements/paper_card.dart';

2. **main_app.html** (bottom):

        <paper-icon-item tabindex="-1">
          <iron-icon icon="search" item-icon></iron-icon>
          <paper-input label="Start address" value="Orem"></paper-input>
        </paper-icon-item>
        <paper-icon-item tabindex="-1">
          <iron-icon icon="search" item-icon></iron-icon>
          <paper-input label="End address" value="SLC"></paper-input>
        </paper-icon-item>
        
3. **main_app.html** (wrap code from step 2):

        <paper-card elevation="2">
          <paper-icon-item tabindex="-1">
            ...
          </paper-icon-item>
          <paper-icon-item tabindex="-1">
            ...
          </paper-icon-item>
        </paper-card>

4. **main_app.html** (`<style>`):

        paper-card {
          position: absolute;
          bottom: 25px;
          left: 25px;
          z-index: 1;
        }

5. Run: Card shows up on lower-left corner of map.

###DATA BINDING
1. **main_app.dart**: Delete `ready()`.
2. `<google-map>`: `map="{{map}}"` (NOTE: No need for imperative versions if you don't need to access the values.)
3. `<google-map-directions>`: `map="{{map}}"`
4. Run: Even without `ready()`, the directions should still show up on the map.
5. `<google-map-directions>`: `start-address="{{start}}" end-address="{{end}}"`
6. `<paper-input>` 1: `value="{{start}}"`
7. `<paper-input>` 2: `value="{{end}}"`
8. Run: Enter **CA** and **NYC** in the inputs and watch the map update. (NOTE: Bug in paper-icon-item eats spaces.)

###TRAVEL MODE
1. **main_app.dart**:

        import 'package:polymer_elements/maps_icons.dart';
        import 'package:polymer_elements/paper_tabs.dart';

2. **main_app.html**: (inside `<paper-card>`, after the `<paper-icon-item>` tags)

        <paper-tabs selected="0">
          <paper-tab>
            <iron-icon icon="maps:directions-car"></iron-icon>
            <span>DRIVING</span>
          </paper-tab>
          <paper-tab>
            <iron-icon icon="maps:directions-walk"></iron-icon>
            <span>WALKING</span>
          </paper-tab>
          <paper-tab>
            <iron-icon icon="maps:directions-bike"></iron-icon>
            <span>BICYCLING</span>
          </paper-tab>
          <paper-tab>
            <iron-icon icon="maps:directions-transit"></iron-icon>
            <span>TRANSIT</span>
          </paper-tab>
        </paper-tabs>

3. Run: Four tabs with yellow highlights and ripples appear at bottom of card.

4. **main_app.html**: (inside `<style>`)

        paper-tabs {
          --paper-tabs-selection-bar-color: #0D47A1;
          margin-top: 16px;
        }
        
        paper-tab {
          --paper-tab-ink: #BBDEFB;
        }
    
        paper-tab iron-icon {
          margin-right: 10px;
        }
        
        paper-tab.iron-selected {
          background: rgb(66, 133, 244);
          color: white;
        }

5. Run: Tab theme is now blue.

6. **main_app.html**: (inside `<style>`, inside `paper-card` -- fixes card resize on tab selection)

        width: 490px;
        
7. Run: Card stops resizing as user interacts with tabs.

8. **main_app.html**: (`<google-map-directions>`)

        travel-mode="[[travelMode]]"
        
9. **main_app.html**: (`<paper-tabs>`)

        selected="{{travelMode}}" attr-for-selected="label"
        
10. **main_app.html**: (`<paper-tab>` tags)

        <paper-tab label="DRIVING">
        ...
        <paper-tab label="WALKING">
        ...
        <paper-tab label="BICYCLING">
        ...
        <paper-tab label="TRANSIT">
        ...

11. Run: Enter start and end addresses. Clicking travel modes alters display.

12. **main_app.dart**: (MainApp class -- to restore default tab selection)

          @property
          String travelMode = "DRIVING";
