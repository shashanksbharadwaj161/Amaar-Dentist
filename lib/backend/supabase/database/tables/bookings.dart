import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get isDone => getField<bool>('isDone');
  set isDone(bool? value) => setField<bool>('isDone', value);

  String? get docName => getField<String>('docName');
  set docName(String? value) => setField<String>('docName', value);

  String? get docImage => getField<String>('docImage');
  set docImage(String? value) => setField<String>('docImage', value);

  String? get docLocation => getField<String>('docLocation');
  set docLocation(String? value) => setField<String>('docLocation', value);

  String? get bookingID => getField<String>('bookingID');
  set bookingID(String? value) => setField<String>('bookingID', value);

  String? get patientName => getField<String>('patientName');
  set patientName(String? value) => setField<String>('patientName', value);

  String? get patientImage => getField<String>('patientImage');
  set patientImage(String? value) => setField<String>('patientImage', value);

  String? get patientPhNo => getField<String>('patientPhNo');
  set patientPhNo(String? value) => setField<String>('patientPhNo', value);

  String? get problem => getField<String>('problem');
  set problem(String? value) => setField<String>('problem', value);

  double? get docRatings => getField<double>('docRatings');
  set docRatings(double? value) => setField<double>('docRatings', value);

  DateTime? get time => getField<DateTime>('time');
  set time(DateTime? value) => setField<DateTime>('time', value);

  String? get cancelReason => getField<String>('cancelReason');
  set cancelReason(String? value) => setField<String>('cancelReason', value);

  int? get patientID => getField<int>('patientID');
  set patientID(int? value) => setField<int>('patientID', value);

  int? get doctorID => getField<int>('doctorID');
  set doctorID(int? value) => setField<int>('doctorID', value);
}
