import 'package:flutter/material.dart';

// Formatos soportados: JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP and WBMP
// También soporta otros formatos si la plataforma soporta las API's para dibujarlos. Flutter llama dichas API's para que los dibujen por su cuenta.
class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Widgets'),
      ),
      body: const ImagesList(),
    );
  }
}

class ImagesList extends StatelessWidget {
  const ImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            // Se aprecia la carga cuando son imágenes muy pesadas
            'https://vastphotos.com/files/uploads/photos/10114/new-york-city-sunrise-skyline-vast-xl.jpg?v=20220712073521',
            // el callback llamado loadingBuilder se va llamando a medida que se va descargando la imagen
            // el child es el widget image, lo que se pinta. El loadingProgress es el indicador de progreso de la descarga. Cuando es null, ya cargó la imagen (devuelve child), cuando no, pinta el indicador de progreso
            // La idea del loadingBuilder es que sirve para hacer algo mientras la imagen se va descargando.
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                  child: CircularProgressIndicator(
                // Las siguientes 3 líneas pueden sobrar. Es para personalizar el valor del CircularProgressIndicator en la medida que descarga la imagen.
                // El value asignado produce que el círculo no se mueva y se llene completamente.
                // El valor por defecto hace que gire el círculo mientras se llena.
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
              'https://scontent.fclo5-1.fna.fbcdn.net/v/t31.18172-8/21083223_1967751673472041_5774304184765558079_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=e3f864&_nc_ohc=EfGmALz3o_cAX9jpsQS&_nc_ht=scontent.fclo5-1.fna&oh=00_AfDus8ogcZX5Y_R_hGC-JEX-9axOCH9HR5EIClBPwf0dUA&oe=64341D70'),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assets/images/bread_cat1.jpeg')),
        ),
        Image.asset('assets/images/bread_cat2.jpeg'),
      ]),
    );
  }
}
