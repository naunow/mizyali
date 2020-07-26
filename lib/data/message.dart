import 'package:flutter/material.dart';

class Message {
  final name;
  final Function(int) countDays;
  final description;
  final reminderLabelText;
  final reminderHintText;
  final cycleLabelText;
  final cycleHintText;
  final reminderButton;
  final saveButton;
  final tabMenuHome;
  final tabMenuCalender;
  final Function(String) validationRequireMessage;
  // final validationMessageName;
  // final validationMessageDescription;

  Message({
    @required this.name,
    @required this.countDays,
    @required this.description,
    @required this.reminderLabelText,
    @required this.reminderHintText,
    @required this.cycleLabelText,
    @required this.cycleHintText,
    @required this.reminderButton,
    @required this.saveButton,
    @required this.tabMenuHome,
    @required this.tabMenuCalender,
    @required this.validationRequireMessage,
    // @required this.validationMessageName,
    // @required this.validationMessageDescription,
  });

  factory Message.of(Locale locale) {
    switch (locale.languageCode) {
      case 'ja':
        return Message.ja();
      case 'en':
        return Message.en();
      default:
        return Message.ja();
    }
  }

  factory Message.ja() => Message(
        name: "なまえ",
        countDays: (count) => "$count 日目",
        description: "説明",
        reminderButton: "リマインダーを追加",
        reminderLabelText: "リマインダー",
        reminderHintText: "リマインダー",
        cycleLabelText: "周期",
        cycleHintText: "2日ごと",
        saveButton: "Save",
        tabMenuHome: 'HOME',
        tabMenuCalender: 'CALENDER',
        validationRequireMessage: (title) => "$title は必須項目です",
        // validationMessageName: "名前は必須項目です",
      );

  factory Message.en() => Message(
        name: "Name",
        countDays: (count) => count > 1 ? "$count Days" : "$count Day",
        description: "Description",
        reminderButton: "Add Reminder",
        reminderLabelText: "Reminder",
        reminderHintText: "Reminder",
        cycleLabelText: "Cycle",
        cycleHintText: "Every 2 days",
        saveButton: "Save",
        tabMenuHome: 'HOME',
        tabMenuCalender: 'CALENDER',
        validationRequireMessage: (title) => "The $title is required.",
        // validationMessageDescription: "The Description is required.",
        // validationMessageName: "The Name is required.",
      );
}
