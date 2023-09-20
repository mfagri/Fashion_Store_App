import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/splash.dart';


class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  dynamic me;
  dynamic location;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) => Container(
        color: const Color.fromARGB(85, 245, 245, 245),
        child: Column(children: [
          Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const  SizedBox(
                              height: 20,
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () {
                                token.removeData('access_token');
                                Navigator.pushNamed(context, '/welcome');
                              },
                              icon: const  Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value.myuser.username.toString().toUpperCase(),
                              style:  const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              value.myuser.email.toString(),
                              style:const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ]),
                ),
              )),
          Expanded(
            child: Container(
                color: Colors.grey[100],
                height: MediaQuery.of(context).size.height * .5,
                child: LocationMap(locationLatLng: value.location)),
          ),
        ]),
      ),
    );
  }
}

class LocationMap extends StatefulWidget {
  final LatLng locationLatLng;

 const  LocationMap({
    Key? key,
    required this.locationLatLng,
  }) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  final MapController mapController = MapController();
  late List<Marker> markers;

  @override
  void initState() {
    super.initState();
    markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: widget.locationLatLng,
        builder: (ctx) => const Icon(Icons.location_on,color: Colors.red,)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: widget.locationLatLng,
        zoom: 10,
        maxZoom: 30,
      ),
      children: <Widget>[
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 45,
            size: const Size(40, 40),
            anchorPos: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: const FitBoundsOptions(
              padding: EdgeInsets.all(50),
              maxZoom: 15,
            ),
            markers: markers,
            builder: (context, markers) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    markers.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
