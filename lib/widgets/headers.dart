import 'package:flutter/material.dart';

class HeaderSquare extends StatelessWidget {
  const HeaderSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          color: const Color(0xff615aab),
        ),
      ],
    );
  }
}

class HeaderRoundedBorders extends StatelessWidget {
  const HeaderRoundedBorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Color(0xff615aab),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    final path = Path();

    // Dibujar con el path y el pain
    path.moveTo(0, size.height * .3);
    path.lineTo(size.width, size.height * .28);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderDiagonalPainter oldDelegate) => true;
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    final path = Path();

    // Dibujar con el path y el pain
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderTriangularPainter oldDelegate) => true;
}

class HeaderTriangularInverse extends StatelessWidget {
  const HeaderTriangularInverse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: HeaderTriangularInversePainter(),
      ),
    );
  }
}

class HeaderTriangularInversePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    final path = Path();

    // Dibujar con el path y el pain
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderTriangularInversePainter oldDelegate) => true;
}

class HeaderPickaxe extends StatelessWidget {
  const HeaderPickaxe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: HeaderPickaxePainter(),
      ),
    );
  }
}

class HeaderPickaxePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    final path = Path();

    // Dibujar con el path y el pain
    path.moveTo(0, size.height * .2);
    path.lineTo(size.width * .5, size.height * .28);
    path.lineTo(size.width, size.height * .2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderPickaxePainter oldDelegate) => true;
}

class HeaderCurved extends StatelessWidget {
  const HeaderCurved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: HeaderCurvedPainter(),
      ),
    );
  }
}

class HeaderCurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el pain
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(
      // Coordenada que indica el punto mas alto en la curvatura
      size.width * .5,
      // Coordenada que indica la altura de la cutvatura
      // Si es mas de .25 la curvatura sera hacia abajo
      // Si es menos de .25 la curvatura sera hacia arriba
      size.height * .4,
      size.width, // Coordernada en x para el punto final
      size.height * .25, // Coordenada den y para el punto final
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderCurvedPainter oldDelegate) => true;
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: HeaderWavesPainter(),
      ),
    );
  }
}

class HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el pain
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(
      size.width * .25,
      size.height * .3,
      size.width * .5,
      size.height * .25,
    );
    path.quadraticBezierTo(
      size.width * .75,
      size.height * .2,
      size.width,
      size.height * .25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderWavesPainter oldDelegate) => true;
}

class HeaderWavesInverse extends StatelessWidget {
  const HeaderWavesInverse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: HeaderWavesInversePainter(),
      ),
    );
  }
}

class HeaderWavesInversePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el pain
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * .75);
    path.quadraticBezierTo(
      size.width * .25,
      size.height * .70,
      size.width * .5,
      size.height * .75,
    );
    path.quadraticBezierTo(
      size.width * .75,
      size.height * .80,
      size.width,
      size.height * .75,
    );
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderWavesInversePainter oldDelegate) => true;
}
