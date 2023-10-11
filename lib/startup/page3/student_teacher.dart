
import 'package:flutter/material.dart';
import '../../info_var.dart';

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
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purpleAccent : null,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isSelected ? Colors.purpleAccent : Colors.grey[300]!,
          width: 3,
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

class SetRole extends StatefulWidget {
  const SetRole({Key? key}) : super(key: key);

  @override
  State<SetRole> createState() => _SetRoleState();
}

class _SetRoleState extends State<SetRole> {
  int _value = 1;
  static var descript = 'Select Student if you are new and learning to exercise either from an instructor or self learning \n';
  static var subdescript = 'Note that the STUDENT\'s role have different contents than the instructor';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: MyRadioListTile<int>(
                  value: 1,
                  groupValue: _value,
                  leading: 'S',
                  title: const Text(
                    'Student',
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                      Personal_info.Role = 'Student';
                      descript =
                      'Select Student if you are new and learning to exercise either from an instructor or self learning \n';
                      subdescript =
                      'Note that the STUDENTS\'s role have different contents than the instructor';
                    });
                  },
                ),
              ),
              Expanded(
                child: MyRadioListTile<int>(
                  value: 2,
                  groupValue: _value,
                  leading: 'T',
                  title: const Text(
                    'Instructor',
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                      Personal_info.Role = 'Instructor';
                      descript =
                      'Select Instructor if you have an experience on workout or planning to teach as an instructor\n';
                      subdescript =
                      'Note that the INSTRUCTOR\'s role have different contents than the student';
                    });
                  },
                ),
              ),
            ],
          ),
          Text(descript,textAlign: TextAlign.center,style: const TextStyle(fontSize: 17.0, color: Colors.amberAccent),),
          Text(subdescript,style: const TextStyle(fontSize: 14.0, color: Colors.lightBlue),),],
      ),
    );
  }
}
