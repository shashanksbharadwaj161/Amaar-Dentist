import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_search_widget.dart' show MapSearchWidget;
import 'package:flutter/material.dart';

class MapSearchModel extends FlutterFlowModel<MapSearchWidget> {
  ///  Local state fields for this page.

  List<LocationDatatypeStruct> places = [];
  void addToPlaces(LocationDatatypeStruct item) => places.add(item);
  void removeFromPlaces(LocationDatatypeStruct item) => places.remove(item);
  void removeAtIndexFromPlaces(int index) => places.removeAt(index);
  void insertAtIndexInPlaces(int index, LocationDatatypeStruct item) =>
      places.insert(index, item);
  void updatePlacesAtIndex(
          int index, Function(LocationDatatypeStruct) updateFn) =>
      places[index] = updateFn(places[index]);

  List<String> compos = ['clinicCoordinates'];
  void addToCompos(String item) => compos.add(item);
  void removeFromCompos(String item) => compos.remove(item);
  void removeAtIndexFromCompos(int index) => compos.removeAt(index);
  void insertAtIndexInCompos(int index, String item) =>
      compos.insert(index, item);
  void updateComposAtIndex(int index, Function(String) updateFn) =>
      compos[index] = updateFn(compos[index]);

  String? latlng;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getClinicLocation)] action in mapSearch widget.
  ApiCallResponse? outputAPI;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
