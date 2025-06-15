import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get review => getField<String>('review');
  set review(String? value) => setField<String>('review', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get patientID => getField<String>('patientID');
  set patientID(String? value) => setField<String>('patientID', value);

  String? get doctorID => getField<String>('doctorID');
  set doctorID(String? value) => setField<String>('doctorID', value);

  String? get patientName => getField<String>('patientName');
  set patientName(String? value) => setField<String>('patientName', value);

  String? get patientPhoto => getField<String>('patientPhoto');
  set patientPhoto(String? value) => setField<String>('patientPhoto', value);
}
