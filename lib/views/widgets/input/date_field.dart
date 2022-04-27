import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class DateField extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final TextEditingController dateController;
  final String errorMessage;

  DateField({
    Key? key,
    required this.firstDate,
    required this.lastDate,
    required this.dateController,
    this.errorMessage = 'This field is required.',
  }) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();

  getDateInput() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: AppColor.secondary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (newDate != null) {
      setState(
        () {
          selectedDate = newDate;
          widget.dateController.text =
              DateFormat('yyyy-MM-dd').format(selectedDate);
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    widget.dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: true,
          key: UniqueKey(),
          onTap: getDateInput,
          controller: widget.dateController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.event,
              color: AppColor.gray,
            ),
          ),
        ),
      ],
    );
  }
}
