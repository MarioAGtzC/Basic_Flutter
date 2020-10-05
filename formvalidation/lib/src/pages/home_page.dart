import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if(snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) => _crearItem(context, productosBloc, snapshot.data[i], snapshot.data, i),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc, ProductoModel producto, List<ProductoModel> productos, int i) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) => productosBloc.borrarProducto(producto.id),
      child: Card(
        child: Column(
          children: <Widget>[
            (producto.fotoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(producto.fotoUrl),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text(producto.id),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
            ),
          ],
        ),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}