import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_osm_kirimin/Page/Lacak_pesanan.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_osm_kirimin/main.dart';

class BerandaPage extends StatefulWidget {

  const BerandaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  String result = '';

  double? currentLatitude;
  double? currentLongitude;
  bool shouldTrackPosition = false;

  final _mapController = MapController(
      initMapWithUserPosition: true
  );

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  void getCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLatitude = currentPosition.latitude;
      currentLongitude = currentPosition.longitude;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    double? paketLatitude = Provider.of<PaketData>(context).paketLatitude;
    double? paketLongitude = Provider.of<PaketData>(context).paketLongitude;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: const Color(0xFF70986C),
        title: ElevatedButton.icon(
            icon: const Icon(Icons.search),
            label: const Text("Lacak Pesanan"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const lacakPesananPage()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF717070),
                foregroundColor: Colors.white,
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                )
            )
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: OSMFlutter(controller: _mapController,
        mapIsLoading: const Center(
            child: CircularProgressIndicator()
        ),
        trackMyPosition: shouldTrackPosition,
        initZoom: 12,
        minZoomLevel: 2,
        maxZoomLevel: 19,
        stepZoom: 1.0,
        androidHotReloadSupport: true,
        userLocationMarker: UserLocationMaker (
            personMarker: const MarkerIcon(
              icon: Icon(Icons.location_history_rounded,color: Color(0xFF70986C),size: 96),
            ),
            directionArrowMarker: const MarkerIcon(
                icon: Icon(Icons.location_on,color: Color(0xFF70986C),size: 96,)
            )
        ),
        roadConfiguration: const RoadOption(roadColor: Color(0xFF70986C),zoomInto: true,roadWidth: 15),
        onMapIsReady: (isReady) async {
          if(isReady){
            await Future.delayed(const Duration(seconds: 1),() async{
              await _mapController.currentLocation();
              if (paketLatitude != null && paketLongitude != null) {
                await _mapController.addMarker(
                    GeoPoint(
                        latitude: paketLatitude!, longitude: paketLongitude!),
                    markerIcon: const MarkerIcon(
                        icon: Icon(Icons.backpack, color: Color(0xFF70986C),
                            size: 96)));
                if (currentLatitude != null && currentLongitude != null) {
                  shouldTrackPosition = false;
                  await _mapController.drawRoad(
                      GeoPoint(latitude: paketLatitude!, longitude: paketLongitude!),
                      GeoPoint(latitude: currentLatitude!,
                          longitude: currentLongitude!)
                  );
                  await _mapController.zoomToBoundingBox(
                      BoundingBox.fromGeoPoints([
                        GeoPoint(latitude: paketLatitude!, longitude: paketLongitude!),
                        GeoPoint(latitude: currentLatitude!,
                            longitude: currentLongitude!)
                      ]), paddinInPixel: 1000
                  );
                } else {
                  shouldTrackPosition = true;
                };
              } else {
                shouldTrackPosition = true;
              };
            });
          }
        },
      ),
    );
  }
}
