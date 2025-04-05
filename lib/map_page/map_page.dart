import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:untitled/models/robot.dart';

class MapPage extends StatefulWidget {
  final Robot robot;

  const MapPage({super.key, required this.robot});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMap? mapboxMap;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //
    // });
  }

  _drawObjects() async {
    mapboxMap!.annotations.createPointAnnotationManager().then((pointAnnotationManager) async {
      var options = <PointAnnotationOptions>[];
      options.addAll(
        widget.robot.history.map((p) {
          return PointAnnotationOptions(
            iconColor: 0xFFB71C1C,
            iconSize: 2,
            geometry: Point(coordinates: Position(p.location.longitude, p.location.latitude)),
            // image: list,
          );
        }),
      );
      pointAnnotationManager.createMulti(options);
    });

    final annPoly = await mapboxMap!.annotations.createPolylineAnnotationManager();
    await annPoly.create(
      PolylineAnnotationOptions(
        lineColor: 0xFFB71C1C,
        lineWidth: 2,
        geometry: LineString(coordinates: [...widget.robot.history.map((e) => Position(e.location.longitude, e.location.latitude))]),
      ),
    );

    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text('MAP')),
      body: MapWidget(
        key: ValueKey("mapWidget"),
        styleUri: MapboxStyles.MAPBOX_STREETS,
        cameraOptions: CameraOptions(
          zoom: 15,
          center: Point(coordinates: Position(widget.robot.history.last.location.longitude, widget.robot.history.last.location.latitude)),
        ),
        onMapCreated: (MapboxMap ctrl) {
          mapboxMap = ctrl;
          _drawObjects();
        },
      ),
    );
  }
}
