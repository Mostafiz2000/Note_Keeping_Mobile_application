import 'package:flutter/material.dart';

class RoundNeuButton extends StatelessWidget {
  final child;
  final function;

  RoundNeuButton({this.child, this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 70,
        height: 70,
        child: Center(
          child: child,
        ),
        decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(224, 224, 224, 1),
                  offset: Offset(2.0, 5.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5),
              // BoxShadow(
              //     color: Color.fromARGB(255, 48, 166, 77),
              //     offset: Offset(-4.0, -4.0),
              //     blurRadius: 15.0,
              //     spreadRadius: 1.0),
            ]),
      ),
    );
  }
}
