import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MomentosFavoritosScreen extends StatelessWidget {
  static const routeName = '/momentos-favoritos';

  static const List<Map<String, String>> _momentos = [
    {
      'titulo': 'Aterrizaje en un planeta Miller',
      'imagen': 'assets/images/aterrizaje_planeta.gif',
      'detalle': 'En esta escena, el equipo de astronautas liderado'
          ' por el personaje Cooper aterriza en el planeta Miller, '
          'que es uno de los planetas potencialmente habitables '
          'encontrados a través del agujero de gusano.',
      'videoUrl': 'https://www.youtube.com/watch?v=f-3ikC0Pv8s',
    },
    {
      'titulo': 'Viaje a través del agujero de Gargantúa',
      'imagen': 'assets/images/viaje_agujero.gif',
      'detalle': 'En esta parte de la película, Cooper y su equipo'
          ' se aventuran a través del agujero de Gargantúa, un fenómeno'
          ' astrofísico que les permite viajar a través del espacio y el '
          'tiempo.',
      'videoUrl': 'https://www.youtube.com/watch?v=vqkH-azOydXM',
    },
    {
      'titulo': 'Cooper va detrás del dron',
      'imagen': 'assets/images/dron_cooper.gif',
      'detalle': 'En esta escena, Cooper persigue a un dron no tripulado'
          ' en un entorno rural en la Tierra, que está sufriendo graves '
          'problemas ambientales y escasez de recursos.',
      'videoUrl': 'https://www.youtube.com/watch?v=bmz9lMP6aQU',
    },
  ];

  const MomentosFavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _momentos.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Center(
                child: ListTile(
                  leading: Image.asset(
                    _momentos[index]['imagen']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(_momentos[index]['titulo']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text(_momentos[index]['titulo']!),
                          ),
                          body: Column(
                            children: [
                              Image.asset(_momentos[index]['imagen']!),
                              const SizedBox(height: 16),
                              Text(
                                _momentos[index]['detalle']!,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  _launchURL(_momentos[index]['videoUrl']!);
                                },
                                child: const Text('Ver video'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(thickness: 2, height: 2),
            ],
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
