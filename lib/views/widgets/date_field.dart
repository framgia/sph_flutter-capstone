import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class DateField extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  DateField({
    Key? key,
    required this.firstDate,
    required this.lastDate,
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
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text('DATE'),
        ),
        TextFormField(
          readOnly: true,
          key: UniqueKey(),
          onTap: getDateInput,
          initialValue: DateFormat('EEE, d MMM yyyy').format(selectedDate),
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
