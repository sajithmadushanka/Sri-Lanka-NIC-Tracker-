// ignore: file_names
import 'package:flutter/material.dart';
import 'correct_validation.dart';

class DisplayResults extends StatefulWidget {
  final String type;
  final TextEditingController controller;

  const DisplayResults({
    super.key,
    required this.type,
    required this.controller,
  });

  @override
  State<DisplayResults> createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return widget.type != 'newNIC' && widget.type != 'oldNIC'
        ? Text(widget.type.toString())
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Gender : ${CorrectValidation(widget.controller.text.trim(), widget.type).genderPicker()}',
                    style: textStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.type == 'oldNIC'
                    ? Text(
                        'year : 19${CorrectValidation(widget.controller.text.trim(), widget.type).yearPicker()}',
                        style: textStyle)
                    : Text(
                        'year : ${CorrectValidation(widget.controller.text.trim(), widget.type).yearPicker()}',
                        style: textStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Month : ${CorrectValidation(widget.controller.text.trim(), widget.type).monthAndDatePicker()[0].toString()}',
                    style: textStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Day : ${CorrectValidation(widget.controller.text.trim(), widget.type).monthAndDatePicker()[1].toString()}',
                    style: textStyle),
              ),
            ],
          );
  }
}
