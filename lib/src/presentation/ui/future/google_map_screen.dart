import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../library.dart';

class MapSample extends StatefulWidget {
  final double lat;
  final double long;
  const MapSample({super.key, required this.lat, required this.long});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 5.4746,
  );
  List<Marker> myMarkers = [];
  List dataLoc = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of({
          Marker(
              markerId: MarkerId(UniqueKey().toString()),
              position: LatLng(widget.lat,widget.long),
              draggable: true,
              onDragEnd: (end){}
          ),
        }),
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        backgroundColor: AppColors.color045646,
        child: const Icon(Icons.zoom_in,color: AppColors.colorFFFFFF,),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(widget.lat,widget.long),
        zoom: 12.500
    )));
  }
}