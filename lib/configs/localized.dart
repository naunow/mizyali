import 'package:flutter/material.dart';
import 'package:mizyaliapp/data/message.dart';

class Localized {
  Localized(Locale locale) : this.message = Message.of(locale);

  final Message message;

  static Message of(BuildContext context){
    return Localizations.of<Localized>(context, Localized).message;
  }
}