import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import '../choices.dart' as choices;

class FeaturesTileValidation extends StatefulWidget {
  @override
  _FeaturesTileValidationState createState() => _FeaturesTileValidationState();
}

class _FeaturesTileValidationState extends State<FeaturesTileValidation> {
  String _day;
  List<String> _month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        SmartSelect<String>.single(
          title: 'Days',
          selectedValue: _day,
          choiceItems: choices.days,
          onChange: (state) {
            setState(() => _day = state.selected.value);
          },
          validation: (selected) {
            if (selected == null) return 'Please select one or more';
            return null;
          },
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
        const Divider(indent: 20),
        SmartSelect<String>.multiple(
          title: 'Month',
          selectedValue: _month,
          choiceItems: choices.months,
          onChange: (state) {
            setState(() => _month = state.selected.value);
          },
          validation: (selected) {
            if (selected?.isEmpty == true) return 'Please select one or more';
            return null;
          },
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}