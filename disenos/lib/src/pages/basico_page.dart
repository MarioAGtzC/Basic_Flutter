import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold
  );
  final estiloSubtitulo = TextStyle(
    fontSize: 18.0,
    color: Colors.grey
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
          ],
        ),
      )
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage('https://www.cuandovisitar.es/uploads/2018/08/beste-reistijd-banff-canada-1200x675.jpg'),
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Parque nacional Banff',
                    style: estiloTitulo,
                  ),
                  SizedBox(height: 7.0,),
                  Text(
                    'Lago Moraine, Valle de los Diez Picos',
                    style: estiloSubtitulo,
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '91',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _crearAccion(Icons.call, 'CALl'),
        _crearAccion(Icons.near_me, 'ROUTE'),
        _crearAccion(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _crearAccion(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(height: 5.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blue
          ),
        )
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0
        ),
        child: Text(
          'El Parque nacional Banff es el parque nacional más antiguo de Canadá, establecido en las Montañas Rocosas en 1885. Localizado a 180 km al oeste de Calgary, en la provincia de Alberta, abarca 6641 kilómetros cuadrados de terreno montañoso, con numerosos glaciares y campos de hielo, bosques densos de coníferas y paisajes alpestres. La Icefields Parkway se extiende a lo largo del lago Louise, conectando con el parque nacional Jasper en el norte. Los bosques provinciales y el parque nacional Yoho son vecinos al oeste, mientras que el parque nacional Kootenay está situado al sur y el campo de Kananaskis al sureste. El centro comercial principal del parque está en la ciudad de Banff, en el valle del río Bow. Forma parte del conjunto natural denominado Parques de las Montañas Rocosas Canadienses, que fue declarado Patrimonio de la Humanidad por la Unesco en 1984.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}