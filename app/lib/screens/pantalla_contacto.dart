import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaContacto extends StatefulWidget {
  const PantallaContacto({super.key});

  @override
  State<PantallaContacto> createState() => _PantallaContactoState();
}

class _PantallaContactoState extends State<PantallaContacto> {
  int _gifIndex = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _gifIndex = _gifIndex >= 3 ? 1 : _gifIndex + 1;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            child: Image.asset(
              'assets/gif/gif$_gifIndex.gif',
              key: ValueKey<int>(_gifIndex),
              fit: BoxFit.cover,
            ),
          ),

          Container(color: Colors.black.withOpacity(0.6)),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8), 
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(6, 6),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'CONTACTO',
                    style: GoogleFonts.pixelifySans(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Eliezer Rodriguez Marcano\n\nDesarrollador de Software & Hardware\n\nIG: @eliezer23mrm',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pixelifySans(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
