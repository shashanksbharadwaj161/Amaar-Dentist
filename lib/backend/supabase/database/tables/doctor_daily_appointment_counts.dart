import '../database.dart';

class DoctorDailyAppointmentCountsTable
    extends SupabaseTable<DoctorDailyAppointmentCountsRow> {
  @override
  String get tableName => 'doctor_daily_appointment_counts';

  @override
  DoctorDailyAppointmentCountsRow createRow(Map<String, dynamic> data) =>
      DoctorDailyAppointmentCountsRow(data);
}

class DoctorDailyAppointmentCountsRow extends SupabaseDataRow {
  DoctorDailyAppointmentCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DoctorDailyAppointmentCountsTable();

  int? get doctorId => getField<int>('doctor_id');
  set doctorId(int? value) => setField<int>('doctor_id', value);

  String? get doctorName => getField<String>('doctor_name');
  set doctorName(String? value) => setField<String>('doctor_name', value);

  DateTime? get appointmentDate => getField<DateTime>('appointment_date');
  set appointmentDate(DateTime? value) =>
      setField<DateTime>('appointment_date', value);

  int? get numberOfAppointments => getField<int>('number_of_appointments');
  set numberOfAppointments(int? value) =>
      setField<int>('number_of_appointments', value);
}
