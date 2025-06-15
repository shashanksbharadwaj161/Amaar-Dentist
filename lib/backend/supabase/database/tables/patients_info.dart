import '../database.dart';

class PatientsInfoTable extends SupabaseTable<PatientsInfoRow> {
  @override
  String get tableName => 'patients_info';

  @override
  PatientsInfoRow createRow(Map<String, dynamic> data) => PatientsInfoRow(data);
}

class PatientsInfoRow extends SupabaseDataRow {
  PatientsInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PatientsInfoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get fullname => getField<String>('fullname');
  set fullname(String? value) => setField<String>('fullname', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get age => getField<String>('age');
  set age(String? value) => setField<String>('age', value);

  String? get locationstring => getField<String>('locationstring');
  set locationstring(String? value) =>
      setField<String>('locationstring', value);

  String? get patientID => getField<String>('patientID');
  set patientID(String? value) => setField<String>('patientID', value);

  String? get locationMap => getField<String>('locationMap');
  set locationMap(String? value) => setField<String>('locationMap', value);
}
