import '../database.dart';

class DentalTipsTable extends SupabaseTable<DentalTipsRow> {
  @override
  String get tableName => 'dental_tips';

  @override
  DentalTipsRow createRow(Map<String, dynamic> data) => DentalTipsRow(data);
}

class DentalTipsRow extends SupabaseDataRow {
  DentalTipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DentalTipsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
