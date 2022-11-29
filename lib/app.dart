import 'package:flutter/material.dart';
import 'package:sort_app/common/constant/route_names.dart';
import 'package:sort_app/views/sort_form_view.dart';
import 'package:sort_app/views/sort_result_view.dart';
import 'package:provider/provider.dart';

import 'view_models/sort_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SortViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SortFormView(),
        routes: {
          RouteNames.sort: (context) => const SortResultView(),
        },
      ),
    );
  }
}
