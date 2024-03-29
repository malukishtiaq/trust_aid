import 'package:flutter/material.dart';

enum Gender { male, female, other }

class GenderSelection extends StatelessWidget {
  const GenderSelection(
      {super.key, required this.selectedGender, required this.onChanged});

  final Gender selectedGender;
  final ValueChanged<Gender?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildGenderOption(
            context,
            label: 'Male',
            value: Gender.male,
            groupValue: selectedGender,
            onChanged: onChanged,
          ),
          _buildGenderOption(
            context,
            label: 'Female',
            value: Gender.female,
            groupValue: selectedGender,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(
    BuildContext context, {
    required String label,
    required Gender value,
    required Gender groupValue,
    required ValueChanged<Gender?> onChanged,
  }) {
    return Flexible(
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: groupValue == value ? Colors.white : Colors.grey.shade600,
          ),
        ),
        leading: Radio<Gender>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
