// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeEntryImpl _$$TimeEntryImplFromJson(Map<String, dynamic> json) =>
    _$TimeEntryImpl(
      date: DateTime.parse(json['date'] as String),
      duration: json['duration'] as int?,
      description: json['description'] as String?,
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      pauseEnd: json['pauseEnd'] == null
          ? null
          : DateTime.parse(json['pauseEnd'] as String),
      pauseStart: json['pauseStart'] == null
          ? null
          : DateTime.parse(json['pauseStart'] as String),
      projectID: json['projectID'] as String?,
      service: json['service'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      userID: json['userID'] as String?,
    );

Map<String, dynamic> _$$TimeEntryImplToJson(_$TimeEntryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'duration': instance.duration,
      'description': instance.description,
      'endTime': instance.endTime?.toIso8601String(),
      'pauseEnd': instance.pauseEnd?.toIso8601String(),
      'pauseStart': instance.pauseStart?.toIso8601String(),
      'projectID': instance.projectID,
      'service': instance.service,
      'startTime': instance.startTime.toIso8601String(),
      'userID': instance.userID,
    };
