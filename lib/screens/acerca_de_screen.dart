import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  static const routeName = '/acerca-de';

  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Interstellar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Director: Christopher Nolan',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Datos relevantes:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Duración: 2 horas 49 minutos',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Género: Ciencia ficción, Aventura',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Fecha de estreno: 7 de noviembre de 2014',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Calificación: 8.6/10 (IMDb)',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
