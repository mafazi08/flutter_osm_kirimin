import 'package:flutter/material.dart';
import 'package:flutter_osm_kirimin/Page/Lacak_pesanan.dart';
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Color(0xFF70986C),
        title: ElevatedButton.icon(
            icon: Icon(Icons.search),
            label: Text("Lacak Pesanan"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const lacakPesananPage()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF717070),
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
