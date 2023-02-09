import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../bloc/profile_bloc.dart';
import '../../../../../provider/api_provider.dart';

class CalendarScreen extends StatefulWidget {
  final DateTime? dayValue;
  final Function() change;

  const CalendarScreen({
    Key? key,
    required this.dayValue,
    required this.change,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    if (widget.dayValue != null) {
      _focusedDay = widget.dayValue!;
      _selectedDay = widget.dayValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: Colors.white,
        title: const Text(
          "Birthday",
          style: TextStyle(
              color: Color(0xFF223263),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/icons/left.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: const Text(
                  "Your Birhday",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF223263),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 56,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFEBF0FF),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}"
                          .toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TableCalendar(
                headerVisible: false,
                firstDay: DateTime(1900),
                lastDay: DateTime.now(),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = selectedDay;
                    });
                  }
                },
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
            ],
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: GestureDetector(
              onTap: () {
                _setData();
                Navigator.pop(context);
              },
              child: Container(
                height: 58,
                width: MediaQuery.of(context).size.width - 48,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setData() async {
    ApiProvider().putProfileChange({"birth_date": "${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}"});
    profileBloc.userProfile();
    widget.change();
  }
}
