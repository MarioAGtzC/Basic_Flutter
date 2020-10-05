import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  final center = LatLng(19.2408277, -103.7164021);
  String selectedStyle = 'mapbox://styles/greeniegtz/ckfwzdg1o026u19p3pn670bhm';
  final oscuroStyle = 'mapbox://styles/greeniegtz/ckfwzdg1o026u19p3pn670bhm';
  final streetStyle = 'mapbox://styles/greeniegtz/ckfwzg39300bw19tgk9vtjw2o';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Zoomin
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          }
        ),
        SizedBox(height: 5,),
        // Zoomout
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          }
        ),
        SizedBox(height: 5,),
        // Cambiar Estilo
        FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () {
            setState(() {
              if(selectedStyle == oscuroStyle) {
                selectedStyle = streetStyle;
              } else {
                selectedStyle = oscuroStyle;
              }
            });
          }
        )
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 14
      ),
    );
  }
}