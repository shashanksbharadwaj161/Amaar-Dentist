// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationDatatypeStruct extends BaseStruct {
  LocationDatatypeStruct({
    String? clinicName,
    String? clinicCity,
    String? clinicState,
    String? clinicCountry,
    String? clinicZipcode,
    String? clinicAddress,
    LatLng? clinicCoordinates,
    String? clinicCoverPic,
    String? doctorID,
  })  : _clinicName = clinicName,
        _clinicCity = clinicCity,
        _clinicState = clinicState,
        _clinicCountry = clinicCountry,
        _clinicZipcode = clinicZipcode,
        _clinicAddress = clinicAddress,
        _clinicCoordinates = clinicCoordinates,
        _clinicCoverPic = clinicCoverPic,
        _doctorID = doctorID;

  // "clinicName" field.
  String? _clinicName;
  String get clinicName => _clinicName ?? '';
  set clinicName(String? val) => _clinicName = val;

  bool hasClinicName() => _clinicName != null;

  // "clinicCity" field.
  String? _clinicCity;
  String get clinicCity => _clinicCity ?? '';
  set clinicCity(String? val) => _clinicCity = val;

  bool hasClinicCity() => _clinicCity != null;

  // "clinicState" field.
  String? _clinicState;
  String get clinicState => _clinicState ?? '';
  set clinicState(String? val) => _clinicState = val;

  bool hasClinicState() => _clinicState != null;

  // "clinicCountry" field.
  String? _clinicCountry;
  String get clinicCountry => _clinicCountry ?? '';
  set clinicCountry(String? val) => _clinicCountry = val;

  bool hasClinicCountry() => _clinicCountry != null;

  // "clinicZipcode" field.
  String? _clinicZipcode;
  String get clinicZipcode => _clinicZipcode ?? '';
  set clinicZipcode(String? val) => _clinicZipcode = val;

  bool hasClinicZipcode() => _clinicZipcode != null;

  // "clinicAddress" field.
  String? _clinicAddress;
  String get clinicAddress => _clinicAddress ?? '';
  set clinicAddress(String? val) => _clinicAddress = val;

  bool hasClinicAddress() => _clinicAddress != null;

  // "clinicCoordinates" field.
  LatLng? _clinicCoordinates;
  LatLng? get clinicCoordinates => _clinicCoordinates;
  set clinicCoordinates(LatLng? val) => _clinicCoordinates = val;

  bool hasClinicCoordinates() => _clinicCoordinates != null;

  // "clinicCoverPic" field.
  String? _clinicCoverPic;
  String get clinicCoverPic => _clinicCoverPic ?? '';
  set clinicCoverPic(String? val) => _clinicCoverPic = val;

  bool hasClinicCoverPic() => _clinicCoverPic != null;

  // "doctorID" field.
  String? _doctorID;
  String get doctorID => _doctorID ?? '';
  set doctorID(String? val) => _doctorID = val;

  bool hasDoctorID() => _doctorID != null;

  static LocationDatatypeStruct fromMap(Map<String, dynamic> data) =>
      LocationDatatypeStruct(
        clinicName: data['clinicName'] as String?,
        clinicCity: data['clinicCity'] as String?,
        clinicState: data['clinicState'] as String?,
        clinicCountry: data['clinicCountry'] as String?,
        clinicZipcode: data['clinicZipcode'] as String?,
        clinicAddress: data['clinicAddress'] as String?,
        clinicCoordinates: data['clinicCoordinates'] as LatLng?,
        clinicCoverPic: data['clinicCoverPic'] as String?,
        doctorID: data['doctorID'] as String?,
      );

  static LocationDatatypeStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationDatatypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'clinicName': _clinicName,
        'clinicCity': _clinicCity,
        'clinicState': _clinicState,
        'clinicCountry': _clinicCountry,
        'clinicZipcode': _clinicZipcode,
        'clinicAddress': _clinicAddress,
        'clinicCoordinates': _clinicCoordinates,
        'clinicCoverPic': _clinicCoverPic,
        'doctorID': _doctorID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clinicName': serializeParam(
          _clinicName,
          ParamType.String,
        ),
        'clinicCity': serializeParam(
          _clinicCity,
          ParamType.String,
        ),
        'clinicState': serializeParam(
          _clinicState,
          ParamType.String,
        ),
        'clinicCountry': serializeParam(
          _clinicCountry,
          ParamType.String,
        ),
        'clinicZipcode': serializeParam(
          _clinicZipcode,
          ParamType.String,
        ),
        'clinicAddress': serializeParam(
          _clinicAddress,
          ParamType.String,
        ),
        'clinicCoordinates': serializeParam(
          _clinicCoordinates,
          ParamType.LatLng,
        ),
        'clinicCoverPic': serializeParam(
          _clinicCoverPic,
          ParamType.String,
        ),
        'doctorID': serializeParam(
          _doctorID,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationDatatypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LocationDatatypeStruct(
        clinicName: deserializeParam(
          data['clinicName'],
          ParamType.String,
          false,
        ),
        clinicCity: deserializeParam(
          data['clinicCity'],
          ParamType.String,
          false,
        ),
        clinicState: deserializeParam(
          data['clinicState'],
          ParamType.String,
          false,
        ),
        clinicCountry: deserializeParam(
          data['clinicCountry'],
          ParamType.String,
          false,
        ),
        clinicZipcode: deserializeParam(
          data['clinicZipcode'],
          ParamType.String,
          false,
        ),
        clinicAddress: deserializeParam(
          data['clinicAddress'],
          ParamType.String,
          false,
        ),
        clinicCoordinates: deserializeParam(
          data['clinicCoordinates'],
          ParamType.LatLng,
          false,
        ),
        clinicCoverPic: deserializeParam(
          data['clinicCoverPic'],
          ParamType.String,
          false,
        ),
        doctorID: deserializeParam(
          data['doctorID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationDatatypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationDatatypeStruct &&
        clinicName == other.clinicName &&
        clinicCity == other.clinicCity &&
        clinicState == other.clinicState &&
        clinicCountry == other.clinicCountry &&
        clinicZipcode == other.clinicZipcode &&
        clinicAddress == other.clinicAddress &&
        clinicCoordinates == other.clinicCoordinates &&
        clinicCoverPic == other.clinicCoverPic &&
        doctorID == other.doctorID;
  }

  @override
  int get hashCode => const ListEquality().hash([
        clinicName,
        clinicCity,
        clinicState,
        clinicCountry,
        clinicZipcode,
        clinicAddress,
        clinicCoordinates,
        clinicCoverPic,
        doctorID
      ]);
}

LocationDatatypeStruct createLocationDatatypeStruct({
  String? clinicName,
  String? clinicCity,
  String? clinicState,
  String? clinicCountry,
  String? clinicZipcode,
  String? clinicAddress,
  LatLng? clinicCoordinates,
  String? clinicCoverPic,
  String? doctorID,
}) =>
    LocationDatatypeStruct(
      clinicName: clinicName,
      clinicCity: clinicCity,
      clinicState: clinicState,
      clinicCountry: clinicCountry,
      clinicZipcode: clinicZipcode,
      clinicAddress: clinicAddress,
      clinicCoordinates: clinicCoordinates,
      clinicCoverPic: clinicCoverPic,
      doctorID: doctorID,
    );
