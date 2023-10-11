import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;

  final String title;

  final int initValue;

  final int min;

  final int max;

  const AgeWeightWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  _AgeWeightWidgetState createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 12,
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              side: BorderSide(

              ),
            ),
            child: Column(children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.amberAccent,
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter > widget.min) {
                            counter--;
                          }
                        });
                        widget.onChange(counter);
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      counter.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.amberAccent,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          if (counter < widget.max) {
                            counter++;
                          }
                        });
                        widget.onChange(counter);
                      },
                    ),
                  ],
                ),
              )
            ])));
  }
}
