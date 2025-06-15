import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

double? averageRating(
  int? rating,
  double? currentRating,
) {
  if (rating == null || currentRating == null) {
    return null;
  }

  return (currentRating / rating);
}

List<DateTime> getAvailableSlots(
  List<DateTime> reservedSlots,
  DateTime startDateArg,
  int starttime,
  int endtime,
) {
  List<DateTime> availableBookings = [];
  DateTime now = startDateArg;
  DateTime startTime = DateTime(now.year, now.month, now.day, now.hour, 0);
  DateTime endTime = startTime.add(const Duration(days: 2)); // now + 2 da
  // Loop through the time slots from start to end time
  for (DateTime currentTime = startTime;
      currentTime.isBefore(endTime);
      currentTime = currentTime.add(const Duration(hours: 1))) {
    bool isReserved = false;
    // Check if the current time slot is reserved
    for (DateTime reservedTime in reservedSlots) {
      if (currentTime.year == reservedTime.year &&
          currentTime.month == reservedTime.month &&
          currentTime.day == reservedTime.day &&
          currentTime.hour == reservedTime.hour) {
        isReserved = true;
        break;
      }
    }
// Add the current time slot to available bookings if it's not reserved
    if (!isReserved &&
        currentTime.hour >= starttime &&
        currentTime.hour <= endtime) {
      availableBookings.add(currentTime);
    }
  }
  List<DateTime> availableSlots = availableBookings
      .where((DateTime dateTime) => dateTime.day == availableBookings[0].day)
      .toList();
  return availableSlots;
}

List<dynamic> stringtolat(
  String jsonString,
  List<String> coordinates,
) {
  List<dynamic> jsonList = jsonDecode(jsonString);
  for (var jsonMap in jsonList) {
    if (jsonMap is Map<String, dynamic>) {
      for (var campo in coordinates) {
        if (jsonMap.containsKey(campo) && jsonMap[campo] is String) {
          String coordinateString = jsonMap[campo];
          final match = RegExp(r'LatLng\(lat: (.*), lng: (.*)\)')
              .firstMatch(coordinateString);
          if (match != null) {
            double lat = double.parse(match.group(1)!);
            double lng = double.parse(match.group(2)!);
            jsonMap[campo] = LatLng(lat, lng);
          }
        }
      }
    }
  }
  return List<Map<String, dynamic>>.from(jsonList);
}

String lattostring(LatLng latlng) {
  return latlng.toString();
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}
