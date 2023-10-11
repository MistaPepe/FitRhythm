import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
import 'package:fitrhythm/info_var.dart';
class HeightButt extends StatefulWidget {
  const HeightButt({Key? key}) : super(key: key);

  @override
  State<HeightButt> createState() => _HeightButtState();
}

class _HeightButtState extends State<HeightButt>
    with AutomaticKeepAliveClientMixin<HeightButt> {
  late WeightSliderController _controller;
  double _height = Personal_info.height;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: Personal_info.height, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: ElevatedButton(
        child: Text(
            'Height' + "\"${Personal_info.height.toStringAsFixed(1)} cm\""),
        onPressed: () {
          showAlertDialog(context);
        },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,
    shadowColor: Colors.transparent,
      ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
          Personal_info.height = _height;
          _height = Personal_info.height;
        });
        Navigator.of(context).pop();
      },
    );

    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                  title: Text('Height'),
                  content: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "${_height.toStringAsFixed(1)} cm",
                        ),
                      ),
                      Expanded(
                        child: VerticalWeightSlider(
                          controller: _controller,
                          decoration: PointerDecoration(
                            width: 130.0,
                            height: 3.0,
                            largeColor: Color(0xFF898989),
                            mediumColor: Color(0xFFC5C5C5),
                            smallColor: Color(0xFFF0F0F0),
                            gap: 50.0,
                          ),
                          onChanged: (double value) {
                            setState(() {
                              _height = value;
                              Personal_info.height = _height;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    okButton,
                  ]),
            ));
  }
}

class WeightButt extends StatefulWidget {
  const WeightButt({Key? key}) : super(key: key);

  @override
  State<WeightButt> createState() => _WeightButtState();
}

class _WeightButtState extends State<WeightButt> {
  late WeightSliderController _controller;
  double _weight = Personal_info.weight;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: Personal_info.weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: ElevatedButton(
        child: Text(
            'Weight' + "\"${Personal_info.weight.toStringAsFixed(1)} kg\""),
        onPressed: () {
          showAlertDialog(context);
        },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,
    shadowColor: Colors.transparent,
    ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {
          Personal_info.weight = _weight;
        });
        Navigator.of(context).pop();
      },
    );

    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                  title: Text('Weight'),
                  content: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "${_weight.toStringAsFixed(1)} kg",
                        ),
                      ),
                      Expanded(
                        child: VerticalWeightSlider(
                          controller: _controller,
                          decoration: PointerDecoration(
                            width: 130.0,
                            height: 3.0,
                            largeColor: Color(0xFF898989),
                            mediumColor: Color(0xFFC5C5C5),
                            smallColor: Color(0xFFF0F0F0),
                            gap: 50.0,
                          ),
                          onChanged: (double value) {
                            setState(() {
                              _weight = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    okButton,
                  ]),
            ));
  }
}
