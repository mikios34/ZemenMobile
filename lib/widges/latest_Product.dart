// import 'package:flutter/material.dart';
// import 'package:ecommerce/data/data.dart';
// import 'package:ecommerce/models/order.dart';

// class LatestProduct extends StatelessWidget {
//   _recentorder(BuildContext context, Order order) {
//     return Container(
//       margin: EdgeInsets.only(left: 10, top: 5),
//       padding: EdgeInsets.only(left: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(3),
//                 child: Column(
//                   children: [
//                     Image(
//                       height: MediaQuery.of(context).size.width * 0.3,
//                       width: 100,
//                       image: AssetImage(order.food.imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                     Container(
//                         width: 100,
//                         color: Colors.white,
//                         child: Text(
//                           "dsa",
//                           textAlign: TextAlign.right,
//                         )),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//           child: Text(
//             "Latest",
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.2,
//             ),
//           ),
//         ),
//         Container(
//           height: 150.0,
//           //color: Colors.blue,
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: currentUser.orders.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Order order = currentUser.orders[index];
//                 return _recentorder(context, order);
//               }),
//         )
//       ],
//     );
//   }
// }
