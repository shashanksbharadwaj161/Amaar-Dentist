import '../database.dart';

class EnquiryDetailsTable extends SupabaseTable<EnquiryDetailsRow> {
  @override
  String get tableName => 'enquiry details';

  @override
  EnquiryDetailsRow createRow(Map<String, dynamic> data) =>
      EnquiryDetailsRow(data);
}

class EnquiryDetailsRow extends SupabaseDataRow {
  EnquiryDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EnquiryDetailsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);
}
