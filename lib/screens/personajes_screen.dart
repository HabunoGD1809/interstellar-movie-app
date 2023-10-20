import 'package:flutter/material.dart';

class PersonajesScreen extends StatelessWidget {
  static const routeName = '/personajes';

  static const List<Map<String, String>> _personajes = [
    {
      'nombre': 'Cooper',
      'imagen': 'assets/images/cooper.jpg',
      'descripcion': 'Cooper es un ex piloto de la NASA que se convierte en granjero. '
          'Es el personaje principal de la película. La historia comienza cuando descubre '
          'un proyecto secreto de la NASA destinado a encontrar un nuevo hogar para la humanidad, '
          'ya que la Tierra se encuentra al borde de la destrucción debido a la escasez de recursos y '
          'la inminente extinción de la vida en el planeta.',
    },
    {
      'nombre': 'Murph',
      'imagen': 'assets/images/murph.jpg',
      'descripcion': 'Murph es la hija de Cooper y es un personaje clave en la película. Desde joven, '
          'Murph muestra un gran interés por la ciencia y la exploración. A medida que avanza la trama, '
          'Murph desempeña un papel fundamental en el desarrollo de la misión espacial y en la búsqueda '
          'de un nuevo hogar para la humanidad. Su relación con su padre, Cooper, es un tema central en '
          'la película.',
    },
    {
      'nombre': 'Dr. Brand',
      'imagen': 'assets/images/dr_brand.jpg',
      'descripcion': 'El Dr. Brand es una científica de la NASA y uno de los principales miembros del equipo'
          ' que trabaja en la misión espacial para salvar a la humanidad. Su experiencia en física y teoría'
          ' de la relatividad es esencial para el éxito de la misión. El personaje del Dr. Brand desencadena'
          ' una serie de eventos y decisiones cruciales a lo largo de la película.',
    },
  ];

  PersonajesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _personajes.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(_personajes[index]['imagen']!),
                ),
                title: Text(_personajes[index]['nombre']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesPersonajeScreen(
                        nombre: _personajes[index]['nombre']!,
                        imagen: _personajes[index]['imagen']!,
                        descripcion: _personajes[index]['descripcion']!,
                      ),
                    ),
                  );
                },
              ),
              const Divider(thickness: 2, height: 2),
            ],
          );
        },
      ),
    );
  }
}

class DetallesPersonajeScreen extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String descripcion;

  const DetallesPersonajeScreen({
    Key? key,
    required this.nombre,
    required this.imagen,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Column(
        children: [
          Image.asset(imagen),
          const SizedBox(height: 16),
          Text(
            descripcion,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
