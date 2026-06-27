import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black, 
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/fondoPantalla.png',
              fit: BoxFit.cover,
            ),
          ),

          _FondoAnimado(),

          Positioned(
            bottom: size.height * 0.3,
            left: size.width * 0.01,
            child: _BotonSala(
              icono: 'assets/6.png',
              mensaje: 'Eliezer Rodríguez Marcano\n\neliezer.rodriguez.2304@gmail.com',
            ),
          ),

          Positioned(
            top: size.height * 0.12,
            left: size.width * 0.35,
            child: _BotonSala(
              icono: 'assets/7.png',
              mensaje: 'Lenguajes: Python y C# \n\nHerramientas: n8n (comenzando), GitHub \n\nDatos: Estructuración, normalización y estadística.',
            ),
          ),

          Positioned(
            bottom: size.height * 0.3,
            right: size.width * 0.15,
            child: _BotonSala(
              icono: 'assets/8.png',
              mensaje: 'Número:0412-485-1169\nGitHub: Eliezer230',
            ),
          ),

          Positioned(
            top: size.height * 0.3,
            right: size.width * 0.3,
            child: _BotonSala(
              icono: 'assets/9.png',
              mensaje: 'Aficiones:\n\nDesarrollo de videojuegos (RPG 2D).\nVideojuegos retro y animación.\nPixel art y diseño DIY.',
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSala extends StatefulWidget {
  final String icono;
  final String mensaje;

  const _BotonSala({
    required this.icono,
    required this.mensaje,
  });

  @override
  _BotonSalaState createState() => _BotonSalaState();
}

class _BotonSalaState extends State<_BotonSala> {
  
  double ancho = 140;
  double alto = 140;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        setState(() {
          ancho = 110;
          alto = 110;
        });
        
        Future.delayed(const Duration(milliseconds: 150), () {
          setState(() {
            ancho = 140;
            alto = 140;
          });

          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.8), 
            builder: (context) => GestureDetector(
              onTap: () => Navigator.pop(context), 
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      SizedBox(
                        width: 400,
                        height: 400,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/fondoTexto.png',
                              width: 400,
                              height: 400,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                widget.mensaje,
                                textAlign: TextAlign.center,
                                
                                style: GoogleFonts.pixelifySans( 
                                  color: Colors.white, 
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Toca en cualquier lado para cerrar",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
      child: SizedBox(
        width: 140, 
        height: 140,
        child: Center(
          child: AnimatedContainer(
            width: ancho, 
            height: alto,
            duration: const Duration(milliseconds: 150),
            curve: Curves.decelerate,
            decoration: const BoxDecoration(
              color: Colors.transparent, 
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(widget.icono, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}

class _FondoAnimado extends StatefulWidget {
  @override
  __FondoAnimadoState createState() => __FondoAnimadoState();
}

class __FondoAnimadoState extends State<_FondoAnimado> {
  int _gifIndex = 1;
  bool _isVisible = true;
  Timer? _timer;

  final List<List<double>> posiciones = [
    [200.0, 260.0, 120.0, 100.0], 
    [520.0, 20.0, 120.0, 100.0],  
    [560.0, 270.0, 120.0, 100.0],  
  ];

  @override
  void initState() {
    super.initState();
    
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (mounted) {
        
        setState(() {
          _isVisible = false;
        });

        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            setState(() {
              _gifIndex = _gifIndex >= 3 ? 1 : _gifIndex + 1;
              _isVisible = true;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final pos = posiciones[_gifIndex - 1];

    return Positioned(
      top: pos[0],
      left: pos[1],
      width: pos[2],
      height: pos[3],
      child: Opacity(
        opacity: _isVisible ? 1.0 : 0.0, 
        child: Image.asset(
          'assets/gif/gif$_gifIndex.gif',
          key: ValueKey<int>(_gifIndex),
          fit: BoxFit.contain, 
        ),
      ),
    );
  }
}
