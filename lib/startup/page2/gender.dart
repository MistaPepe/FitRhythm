import 'package:fitrhythm/info_var.dart';
import 'package:flutter/material.dart';


class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purpleAccent : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.grey[300]!,
          width: 2,
        ),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600]!,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}


class GenderCall extends StatefulWidget {
  const GenderCall({Key? key}) : super(key: key);

  @override
  State<GenderCall> createState() => _GenderCallState();
}

class _GenderCallState extends State<GenderCall> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
            children: [
              Flexible(
                child: MyRadioListTile<int>(
                  value: 1,
                  groupValue: _value,
                  leading: 'M',
                  title: const Text('Male', style: TextStyle(color: Colors.white),),
                  onChanged: (value)  {setState(() => _value = value!);
                    setState(() => Personal_info.gender = _value);
                  },
                ),
              ),
              Flexible(
                child: MyRadioListTile<int>(
                  value: 2,
                  groupValue: _value,
                  leading: 'F',
                  title: const Text('Female', style: TextStyle(color: Colors.white),),
                  onChanged: (value) {setState(() => _value = value!);
                  setState(() => Personal_info.gender = _value);
                  },
                ),
              ),
            ],
          ),
    );
  }
}