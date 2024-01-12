// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class RestaurantMap extends StatelessWidget {
//   const RestaurantMap({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Создайте контроллер карты
//     final Completer<GoogleMapController> _controller = Completer();

//     // Список ресторанов (замените этот список на ваши реальные данные)
//     final List<Restaurant> restaurants = [
//       Restaurant(name: 'Ресторан 1', lat: 51.5074, lng: -0.1278),
//       Restaurant(name: 'Ресторан 2', lat: 40.7128, lng: -74.0060),
//       // Добавьте другие рестораны с их координатами
//     ];

//     // Создайте начальные координаты для отображения карты
//     const CameraPosition initialCameraPosition = CameraPosition(
//       target: LatLng(51.5074, -0.1278), // Начальные координаты (Лондон, Великобритания)
//       zoom: 10.0, // Уровень масштабирования карты
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Карта ресторанов'),
//       ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: initialCameraPosition,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: restaurants.map((restaurant) {
//           return Marker(
//             markerId: MarkerId(restaurant.name),
//             position: LatLng(restaurant.lat, restaurant.lng),
//             infoWindow: InfoWindow(
//               title: restaurant.name,
//               // Дополнительная информация о ресторане может быть добавлена сюда
//             ),
//           );
//         }).toSet(),
//       ),
//     );
//   }
// }

// class Restaurant {
//   final String name;
//   final double lat;
//   final double lng;

//   Restaurant({required this.name, required this.lat, required this.lng});
// }
