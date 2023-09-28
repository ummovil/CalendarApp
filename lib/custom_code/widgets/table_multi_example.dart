// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

LinkedHashMap<DateTime, List<Event>>? eventsMap;
Future<Map<DateTime, List<Event>>> fetchEvents() async {
  final response = await http
      .get(Uri.parse('http://146.190.114.136:5968/get_agenda_um_calendar'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    //
    LinkedHashMap<DateTime, List<Event>> eventsMap1 =
        LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (var item in jsonResponse) {
      //DateTime date = DateTime.fromMillisecondsSinceEpoch(item['date'] * 1000); // Convert seconds to milliseconds
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          (item['date'] as num).toInt() * 1000);

      String title = item['title'];
      eventsMap1[date] = [Event(title)];
    }

    return eventsMap1;
  } else {
    throw Exception('Failed to load events');
  }
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
/*final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);*/
Future<LinkedHashMap<DateTime, List<Event>>> get kEvents async {
  final events = await fetchEvents();
  return LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(events);
}

/*
final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });
*/
int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class TableMultiExample extends StatefulWidget {
  const TableMultiExample({
    Key? key,
    this.width,
    this.height,
    //this.event,
  }) : super(key: key);

  final double? width;
  final double? height;
  //final List<String> event;

  @override
  _TableMultiExampleState createState() => _TableMultiExampleState();
}

class _TableMultiExampleState extends State<TableMultiExample> {
  final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);
  //LinkedHashMap<DateTime, List<Event>>? _loadedEvents;
  late Map _loadedEvents;
  // late Map eventsMap = {};

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() async {
    _loadedEvents = await kEvents;
    setState(() {}); // Rebuild the widget once the events are loaded.
  }

  // Using a `LinkedHashSet` is recommended due to equality comparison override
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    //return kEvents[day] ?? [];
    // return _loadedEvents?[day] ?? [];
    return _loadedEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Set<DateTime> days) {
    // Implementation example
    // Note that days are in selection order (same applies to events)
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      // Update values in a Set
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
    });

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  cal() {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            selectedDayPredicate: (day) {
              // Use values from Set to mark multiple days as selected
              return _selectedDays.contains(day);
            },
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          //Aqui se define el botón de limpiar seleccion.
          ElevatedButton(
            child: Text('Clear selection'),
            onPressed: () {
              setState(() {
                _selectedDays.clear();
                _selectedEvents.value = [];
              });
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //if (_loadedEvents?.isNotEmpty ?? false) {
    if (_loadedEvents.isNotEmpty) {
      return cal();
    }
    return FutureBuilder<LinkedHashMap<DateTime, List<Event>>>(
      future: kEvents,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()); // Loading indicator
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Error: ${snapshot.error}')); // Error message
        } else {
          _loadedEvents = snapshot.data as Map;
          return cal();
        }
      },
    );

    //return Center(child: CircularProgressIndicator());
  }
}
