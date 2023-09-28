import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> dateTimeToDateAndSlash(List<String> myList) {
  // Get a substring with a List<String> from 0 to 9
  List<String> result = [];
  for (String date in myList) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    result.add(formattedDate);
  }
  return result;
}

String? dMyToddMMy(String originalDate) {
  // transform String d/M/yyyy into a String dd/MM/yyyy

  List<String> dateParts = originalDate.split('/');
  String day = dateParts[0].padLeft(2, '0');
  String month = dateParts[1].padLeft(2, '0');
  String year = dateParts[2];
  return '$day/$month/$year';
}

String singleStringDTTDS(String originalDate) {
  // use dateTimeToDateAndSlash, but with single String
  List<String> myList = [originalDate];
  List<String> result = dateTimeToDateAndSlash(myList);
  return result[0];
}

String? validarFecha(String? vmeses) {
  final fechaActual = DateTime.now();
  String fecha = fechaActual.month.toString();
  if (fecha == fechaActual) {
    return 'si';
  } else {
    return '';
  }
}

String? verifPeriodo(
  String? row,
  String? numCasilla,
) {
  final fechaActual = DateTime.now();
  int month = fechaActual.month;
  String year = fechaActual.year.toString();
  numCasilla = "202" + numCasilla!;

  switch (row) {
    case "1":
      if (month >= 6 && month <= 8) {
        if (year == numCasilla) {
          return "S";
        } else {
          return " ";
        }
      }
      break;
    case "2":
      if (month >= 8 && month <= 12 || month == 1) {
        if (year == numCasilla) {
          return "S";
        } else {
          return " ";
        }
      }
      break;
    case "3":
      if (month >= 1 && month <= 5) {
        if (year == numCasilla) {
          return "S";
        } else {
          return " ";
        }
      }
      break;
  }
}
