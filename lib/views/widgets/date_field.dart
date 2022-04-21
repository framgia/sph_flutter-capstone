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
          key: Key(selectedDate.toString()),
          initialValue: DateFormat('EEE, d MMM yyyy').format(selectedDate),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              splashRadius: 20,
              icon: const Icon(
                Icons.event,
                color: AppColor.gray,
              ),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate,
                  builder: (context, child) {
                    return Theme(
                      child: child!,
                      data: ThemeData(
                        colorScheme: ColorScheme.light(
                          primary: AppColor.secondary,
                        ),
                      ),
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
              },
            ),
          ),
        ),
      ],
    );
  }
}
