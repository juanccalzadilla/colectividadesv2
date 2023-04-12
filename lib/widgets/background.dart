import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Superexpose box
        Positioned(right: 10, top: 400, child: _PinkBox())
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Image(
        width: 300,
        height: 300,
        image: AssetImage('assets/Hosturcitos_Cubiertos.png'));
  }
}
