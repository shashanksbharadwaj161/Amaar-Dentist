import '../database.dart';

class DoctorsInfoTable extends SupabaseTable<DoctorsInfoRow> {
  @override
  String get tableName => 'doctors_info';

  @override
  DoctorsInfoRow createRow(Map<String, dynamic> data) => DoctorsInfoRow(data);
}

class DoctorsInfoRow extends SupabaseDataRow {
  DoctorsInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DoctorsInfoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get doctorID => getField<String>('doctorID');
  set doctorID(String? value) => setField<String>('doctorID', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get fullname => getField<String>('fullname');
  set fullname(String? value) => setField<String>('fullname', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  int get yearsExp => getField<int>('yearsExp')!;
  set yearsExp(int value) => setField<int>('yearsExp', value);

  int get noPatients => getField<int>('noPatients')!;
  set noPatients(int value) => setField<int>('noPatients', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  int? get consultStart => getField<int>('consultStart');
  set consultStart(int? value) => setField<int>('consultStart', value);

  int? get consultEnd => getField<int>('consultEnd');
  set consultEnd(int? value) => setField<int>('consultEnd', value);

  String? get about => getField<String>('about');
  set about(String? value) => setField<String>('about', value);

  String? get locationString => getField<String>('locationString');
  set locationString(String? value) =>
      setField<String>('locationString', value);

  String? get locationMap => getField<String>('locationMap');
  set locationMap(String? value) => setField<String>('locationMap', value);

  int get noRatings => getField<int>('noRatings')!;
  set noRatings(int value) => setField<int>('noRatings', value);

  double? get currentRating => getField<double>('currentRating');
  set currentRating(double? value) => setField<double>('currentRating', value);

  String? get clinicName => getField<String>('clinicName');
  set clinicName(String? value) => setField<String>('clinicName', value);

  String? get clinicCoverPic => getField<String>('clinicCoverPic');
  set clinicCoverPic(String? value) =>
      setField<String>('clinicCoverPic', value);

  String? get clinicCoordinates => getField<String>('clinicCoordinates');
  set clinicCoordinates(String? value) =>
      setField<String>('clinicCoordinates', value);

  String? get clinicCity => getField<String>('clinicCity');
  set clinicCity(String? value) => setField<String>('clinicCity', value);

  String? get clinicState => getField<String>('clinicState');
  set clinicState(String? value) => setField<String>('clinicState', value);

  String? get clinicCountry => getField<String>('clinicCountry');
  set clinicCountry(String? value) => setField<String>('clinicCountry', value);

  String? get clinicZipcode => getField<String>('clinicZipcode');
  set clinicZipcode(String? value) => setField<String>('clinicZipcode', value);

  String? get clinicAddress => getField<String>('clinicAddress');
  set clinicAddress(String? value) => setField<String>('clinicAddress', value);

  int get countOfAppointments => getField<int>('countOfAppointments')!;
  set countOfAppointments(int value) =>
      setField<int>('countOfAppointments', value);

  String? get regNumber => getField<String>('regNumber');
  set regNumber(String? value) => setField<String>('regNumber', value);
}
