import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

  final _mapController = MapController(
      initMapWithUserPosition: true
  );


  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OSMFlutter(controller: _mapController,
        mapIsLoading: const Center(
            child: CircularProgressIndicator()
        ),
        trackMyPosition: true,
        initZoom: 15,
        minZoomLevel: 9,
        maxZoomLevel: 19,
        stepZoom: 1.0,
        androidHotReloadSupport: true,
        userLocationMarker: UserLocationMaker (
            personMarker: const MarkerIcon(
              icon: Icon(Icons.personal_injury,color: Color(0xFF70986C),size: 96),
            ),
            directionArrowMarker: const MarkerIcon(
                icon: Icon(Icons.location_on,color: Color(0xFF70986C),size: 96,)
            )
        ),
        roadConfiguration: const RoadOption(roadColor: Colors.blueGrey),
        markerOption: MarkerOption(
            defaultMarker: MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Color(0xFF70986C),
                size: 96,
              ),
            )),
        onMapIsReady: (isReady) async {
          if(isReady){
            await Future.delayed(const Duration(seconds: 1),() async{
              await _mapController.currentLocation();
            });
          }
        },
      ),
    );
  }
}
