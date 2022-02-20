import 'package:codigo_form/common/enums/gender.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class GenderSwitch extends StatelessWidget {
  const GenderSwitch({
    Key? key,
    required this.gender,
    required this.onChanged,
  }) : super(key: key);

  final Gender gender;
  final Function(int? index)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 72.0,
      minHeight: 56.0,
      initialLabelIndex: gender == Gender.female ? 0 : 1,
      cornerRadius: 32.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: const ["Female", "Male"],
      radiusStyle: true,
      activeBgColor: const [Color(0xFF3BC9DB), Color(0xFF0C8599)],
      animate:
          true, // with just animate set to true, default curve = Curves.easeIn
      curve:
          Curves.linear, // animate must be set to true when using custom curve
      animationDuration: 300,
      onToggle: onChanged,
    );
  }

  bool _isMale(Gender gender) {
    return gender == Gender.male;
  }
}
