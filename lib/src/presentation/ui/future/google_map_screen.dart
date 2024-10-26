import 'dart:async';
import 'dart:developer';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../library.dart';

class MapSample extends StatefulWidget {
  final double lat;
  final double long;

  const MapSample({super.key, required this.lat, required this.long,});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 5.4746,
  );
  List<Marker> myMarkers = [];
  List dataLoc = [];
  bool isLoading = false;

  LocationData? _currentLocation;
  late Location location;

  @override
  void initState() {
    super.initState();
    location = Location();
    _getLocation();
   
  }

  Future<void> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Xizmatning yoqilganligini tekshirish
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Ruxsat olish
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Hozirgi joylashuvni olish
    LocationData _locationData = await location.getLocation();

    setState(() {
      _currentLocation = _locationData;
    });
    setState(() {
      
    });
  }
 

  _openGoogleMaps() async {
    if (_currentLocation == null) {
      log("Location not available");
      return;
    }

    double latitude = _currentLocation!.latitude!;
    double longitude = _currentLocation!.longitude!;
    String destination =
        "${widget.lat},${widget.long}"; // Example destination (Tashkent coordinates)

    Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/dir/?api=1&origin=$latitude,$longitude&destination=$destination&travelmode=driving");

      
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
    setState((){});
    setState((){});
    setState((){});
    setState((){});
    setState((){});
    setState((){});
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of({
          Marker(
              markerId: MarkerId(UniqueKey().toString()),
              position: LatLng(widget.lat, widget.long),
              draggable: true,
              onDragEnd: (end) {}),
        }),
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openGoogleMaps,
        backgroundColor: AppColors.color045646,
        child: const Icon(
          Icons.directions,
          color: AppColors.colorFFFFFF,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(widget.lat, widget.long), zoom: 12.500)));
  }
}
