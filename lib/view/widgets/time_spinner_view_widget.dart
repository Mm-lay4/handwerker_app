import 'package:flutter/material.dart';
import 'symetric_button_widget.dart';

class TimeSpinnerViewWidget extends StatefulWidget {
  final DateTime initTime;
  const TimeSpinnerViewWidget({super.key, required this.initTime});

  @override
  State<TimeSpinnerViewWidget> createState() => _TimeSpinnerViewWidgetState();
}

class _TimeSpinnerViewWidgetState extends State<TimeSpinnerViewWidget> {
  final _hours = List.generate(24, (i) => i);
  final _minutes = List.generate(60, (i) => i);
  late int _selectedHour;
  late int _selectedMinute;

  @override
  void initState() {
    super.initState();

    _selectedHour = _hours.firstWhere((e) => e == widget.initTime.hour);
    _selectedMinute = _minutes.firstWhere((e) => e == widget.initTime.minute);
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(6),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  SizedBox(
                    width: 10 * 25 <= MediaQuery.of(context).size.width * 0.60 ? 300 : null,
                    height: 16 * 25 <= MediaQuery.of(context).size.height * 0.3 ? 600 : 16 * 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 60,
                          child: ListWheelScrollView(
                            itemExtent: 70,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.005,
                            diameterRatio: 1.3,
                            // squeeze: 1.80,
                            useMagnifier: true,
                            magnification: 1.7,
                            controller: FixedExtentScrollController(
                              initialItem: _selectedHour,
                            ),
                            children: _hours
                                .map((j) => Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          '$j',
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight:
                                                  _selectedHour == j ? FontWeight.w700 : null),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (value) {
                              setState(() => _selectedHour = value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            ':',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: ListWheelScrollView(
                            itemExtent: 70,
                            physics: const FixedExtentScrollPhysics(),
                            overAndUnderCenterOpacity: 0.5,
                            perspective: 0.005,
                            diameterRatio: 1.3,
                            // squeeze: 1.80,
                            useMagnifier: true,
                            magnification: 1.7,
                            controller: FixedExtentScrollController(
                              initialItem: _selectedMinute,
                            ),
                            children: _minutes
                                .map((j) => Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          '$j',
                                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight:
                                                  _selectedMinute == j ? FontWeight.w700 : null),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onSelectedItemChanged: (value) {
                              setState(() => _selectedMinute = value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: SymmetricButton(
                        text: 'bestätigen',
                        onPressed: () {
                          Navigator.of(context).pop('$_selectedHour:$_selectedMinute');
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
