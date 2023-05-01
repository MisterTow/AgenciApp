import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vivienda {
  String direccion;
  String descripcion;
  String imagen;
  LatLng ubicacion;
  String precio;

  Vivienda(
      {required this.direccion,
      required this.descripcion,
      required this.imagen,
      required this.ubicacion,
      required this.precio});
}

final List<Vivienda> Viviendas = [
  Vivienda(
    direccion: '18 W 29th St',
    descripcion:
        'Vivienda bar chain offering house-roasted direct-trade Vivienda, along with brewing gear & whole beans',
    ubicacion: LatLng(18.461580, -69.970600),
    imagen:
        'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no',
    precio: "RD1,000,000",
  ),
  Vivienda(
      direccion: '463 7th Ave',
      descripcion:
          'All-day American comfort eats in a basic diner-style setting',
      ubicacion: LatLng(18.462213, -69.966416),
      imagen:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no',
      precio: "RD1,000,000"),
  Vivienda(
      direccion: '240 Sullivan St',
      descripcion:
          'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      ubicacion: LatLng(18.458287, -69.968285),
      imagen:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no',
      precio: "RD1,000,000"),
  Vivienda(
      direccion: '214 E 10th St',
      descripcion:
          'Snazzy, compact Japanese cafe showcasing high-end Vivienda & sandwiches, plus sake & beer at night.',
      ubicacion: LatLng(18.459152, -69.964296),
      imagen:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no',
      precio: "RD1,000,000"),
  Vivienda(
      direccion: '301 W Broadway',
      descripcion:
          'Compact Vivienda & espresso bar turning out drinks made from direct-trade beans in a low-key setting.',
      ubicacion: LatLng(18.463470, -69.964883),
      imagen:
          'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no',
      precio: "RD1,000,000")
];
