// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorDatatypeStruct extends BaseStruct {
  DoctorDatatypeStruct({
    String? fullname,
    String? photoUrl,
    int? noPatients,
    int? yearsExp,
    int? noRatings,
    double? currentRating,
    int? id,
  })  : _fullname = fullname,
        _photoUrl = photoUrl,
        _noPatients = noPatients,
        _yearsExp = yearsExp,
        _noRatings = noRatings,
        _currentRating = currentRating,
        _id = id;

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  set fullname(String? val) => _fullname = val;

  bool hasFullname() => _fullname != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "noPatients" field.
  int? _noPatients;
  int get noPatients => _noPatients ?? 0;
  set noPatients(int? val) => _noPatients = val;

  void incrementNoPatients(int amount) => noPatients = noPatients + amount;

  bool hasNoPatients() => _noPatients != null;

  // "yearsExp" field.
  int? _yearsExp;
  int get yearsExp => _yearsExp ?? 0;
  set yearsExp(int? val) => _yearsExp = val;

  void incrementYearsExp(int amount) => yearsExp = yearsExp + amount;

  bool hasYearsExp() => _yearsExp != null;

  // "noRatings" field.
  int? _noRatings;
  int get noRatings => _noRatings ?? 0;
  set noRatings(int? val) => _noRatings = val;

  void incrementNoRatings(int amount) => noRatings = noRatings + amount;

  bool hasNoRatings() => _noRatings != null;

  // "currentRating" field.
  double? _currentRating;
  double get currentRating => _currentRating ?? 0.0;
  set currentRating(double? val) => _currentRating = val;

  void incrementCurrentRating(double amount) =>
      currentRating = currentRating + amount;

  bool hasCurrentRating() => _currentRating != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static DoctorDatatypeStruct fromMap(Map<String, dynamic> data) =>
      DoctorDatatypeStruct(
        fullname: data['fullname'] as String?,
        photoUrl: data['photo_url'] as String?,
        noPatients: castToType<int>(data['noPatients']),
        yearsExp: castToType<int>(data['yearsExp']),
        noRatings: castToType<int>(data['noRatings']),
        currentRating: castToType<double>(data['currentRating']),
        id: castToType<int>(data['id']),
      );

  static DoctorDatatypeStruct? maybeFromMap(dynamic data) => data is Map
      ? DoctorDatatypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fullname': _fullname,
        'photo_url': _photoUrl,
        'noPatients': _noPatients,
        'yearsExp': _yearsExp,
        'noRatings': _noRatings,
        'currentRating': _currentRating,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullname': serializeParam(
          _fullname,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'noPatients': serializeParam(
          _noPatients,
          ParamType.int,
        ),
        'yearsExp': serializeParam(
          _yearsExp,
          ParamType.int,
        ),
        'noRatings': serializeParam(
          _noRatings,
          ParamType.int,
        ),
        'currentRating': serializeParam(
          _currentRating,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static DoctorDatatypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoctorDatatypeStruct(
        fullname: deserializeParam(
          data['fullname'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        noPatients: deserializeParam(
          data['noPatients'],
          ParamType.int,
          false,
        ),
        yearsExp: deserializeParam(
          data['yearsExp'],
          ParamType.int,
          false,
        ),
        noRatings: deserializeParam(
          data['noRatings'],
          ParamType.int,
          false,
        ),
        currentRating: deserializeParam(
          data['currentRating'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DoctorDatatypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DoctorDatatypeStruct &&
        fullname == other.fullname &&
        photoUrl == other.photoUrl &&
        noPatients == other.noPatients &&
        yearsExp == other.yearsExp &&
        noRatings == other.noRatings &&
        currentRating == other.currentRating &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [fullname, photoUrl, noPatients, yearsExp, noRatings, currentRating, id]);
}

DoctorDatatypeStruct createDoctorDatatypeStruct({
  String? fullname,
  String? photoUrl,
  int? noPatients,
  int? yearsExp,
  int? noRatings,
  double? currentRating,
  int? id,
}) =>
    DoctorDatatypeStruct(
      fullname: fullname,
      photoUrl: photoUrl,
      noPatients: noPatients,
      yearsExp: yearsExp,
      noRatings: noRatings,
      currentRating: currentRating,
      id: id,
    );
