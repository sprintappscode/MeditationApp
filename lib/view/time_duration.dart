import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeValue {
  final int _key;
  final String _value;
  TimeValue(this._key, this._value);
}

class TimeDuration extends StatefulWidget {
  int? timeDuration;
  var onChange;

  TimeDuration({super.key, this.timeDuration, this.onChange});

  @override
  TimeDurationState createState() => TimeDurationState();
}

class TimeDurationState extends State<TimeDuration> {
  int _currentTimeValue = 1;

  final _buttonOptions = [
    TimeValue(30, "30 Seconds"),
    TimeValue(60, "1 minutes"),
    TimeValue(120, "2 minutes"),
    TimeValue(240, "4 minutes"),
    TimeValue(300, "5 minutes"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.35,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: _buttonOptions
            .map((timeValue) => RadioListTile<int>(
                  groupValue: _currentTimeValue,
                  title: Text(timeValue._value),
                  value: timeValue._key,
                  onChanged: (val) {
                    widget.onChange(val);
                    setState(() {
                      debugPrint('VAL = $val');
                      _currentTimeValue = val!;
                      widget.timeDuration = val;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
