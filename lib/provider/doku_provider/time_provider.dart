import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/constants/api/api.dart';
import 'package:handwerker_app/models/time_models/time_entry_vm/time_entry.dart';
import 'package:handwerker_app/models/time_models/time_track_dm/time_track.dart';
import 'package:handwerker_app/models/time_models/workday_models/workday_vm.dart';
import 'package:handwerker_app/provider/settings_provider/user_provider.dart';

final timeEntryProvider =
    NotifierProvider<TimeEntryNotifier, List<TimeEntry>>(() => TimeEntryNotifier());

class TimeEntryNotifier extends Notifier<List<TimeEntry>> {
  final Api _api = Api();
  @override
  build() => [];

  void uploadTimeEntry(TimeEntry entry) async {
    try {
      final response = await _api.postTimeEnty(entry.toJson());
      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          ref.read(userProvider.notifier).userLogOut();
          return;
        }
        log('Request not completed: ${response.statusCode} Backend returned : ${response.data}  \n as Message');
        return;
      }
      final jsonResponse = response.data;
      final eentry = TimeEntry.fromJson(jsonResponse);
      final list = <TimeEntry>[...state, eentry];
      state = list;
      log('request success-> $jsonResponse');
      return;
    } catch (e) {
      log('request was incompleted this was the error: $e');
    }
  }

  Future<List<TimeTrack>> loadtimeTracks() async {
    try {
      final response = await _api.getAllTimeTracks;
      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          ref.read(userProvider.notifier).userLogOut();
          return <TimeTrack>[];
        }
        log('Request not completed: ${response.statusCode} Backend returned : ${response.data}  \n as Message');
        return [];
      }
      final List data = response.data.map((e) => e).toList();
      log(data.toString());
      data.map((e) => e.asMap());
      return data.map((e) => TimeTrack.fromJson(e)).toSet().toList();
    } catch (e) {
      log('request was incompleted this was the error: $e');
      return [];
    }
  }

  // sortiere einträge in workdays
  List<Workday?> getListOfWorkdays() {
    List<Workday> listOfWorkdays = [];
    for (var e in state) {
      if (listOfWorkdays.any((element) =>
          element.date.day == e.startTime.day &&
          element.date.month == e.startTime.month &&
          element.date.year == e.startTime.year)) {
        final date = listOfWorkdays.firstWhere((element) =>
            element.date.day == e.startTime.day &&
            element.date.month == e.startTime.month &&
            element.date.year == e.startTime.year);
        date.timeEntries.add(e);
      } else if (!listOfWorkdays.any((element) =>
          element.date.day == e.startTime.day &&
          element.date.month == e.startTime.month &&
          element.date.year == e.startTime.year)) {
        listOfWorkdays.add(Workday(date: e.startTime, timeEntries: [e]));
      } else {
        log('no matches');
      }
    }
    return listOfWorkdays;
  }
}
