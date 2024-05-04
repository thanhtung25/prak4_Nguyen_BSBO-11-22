// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:myapp/ListViewName.dart';
// import 'package:myapp/ListView_Separated.dart';
// import 'package:myapp/Screen_List.dart';
// import 'package:myapp/homepage.dart';
// import 'package:myapp/routednavigation.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     // return   const MaterialApp(
//     //   debugShowCheckedModeBanner: false,
//     //   home:HomePage(),
//     //   routes: {
//     //     '/list' :(context) => const ScreenList(),
//     //     '/listview' :(context) => const ListViewName(),
//     //     '/listviewseparated':(context) => const ListViewSeparated(),
//     //     '/lastpage':(context) => const LastPage()
//     //   },
//     // );
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: _router,
//     );
//   }

//   final GoRouter _router = GoRouter(
//      routes: <GoRoute>[
//       GoRoute(
//         routes:  <GoRoute>[
//           GoRoute(path: 'RoutedNavigation',
//             builder: (context, state) => const RoutedNavigation(),
//             routes: <GoRoute>[
//                   GoRoute(path: 'listview',
//                 builder: (context, state) => const ListViewName(),
//               ),
//               GoRoute(path: 'listviewseparated',
//                 builder: (context, state) => const ListViewSeparated(),
//               ),
//               GoRoute(path: 'list',
//                 builder: (lastpage, state) => const ScreenList(),
//               ),
//             ]
//           ),
//         ],path: '/',
//         builder: (context, state) => const HomePage(),
//       )
//      ]
//     );

// }



import 'package:flutter/material.dart';
import 'package:myapp/ListViewName.dart';
import 'package:myapp/ListView_Separated.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: const ListViewSeparated()
    );
  }
}
