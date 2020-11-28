import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  final String title;
  final Color color;
  //this function sets value in the main widget
  final Function setDate;
  const DateTimePicker(
      {@required this.setDate, Key key, this.title, this.color})
      : super(key: key);
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  //this is for display screen
  DateTime selectedDate;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.setDate(picked);
      });
    }
  }

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: widget.color == null ? Colors.grey[400] : widget.color,
        ),
      ),
      child: ListTile(
        onTap: () => _selectDate(context),
        leading: Icon(
          Icons.calendar_today,
          color: widget.color == null ? Colors.grey[400] : widget.color,
        ),
        title: Text(
            '${widget.title}\n${selectedDate.year}-${selectedDate.month}-${selectedDate.day}'),
      ),
    );
  }
}
