import 'package:bloc_course/bloc/post_bloc.dart';
import 'package:bloc_course/cubit/CounterCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomePage.dart';
import 'PostPage.dart';
import 'cubit2/PostsCubit.dart';

void main() {
  runApp(

    /*
    BlocProvider
    لتعريف الcubit الخاص بنا ..فنحن نريد في الHomePage الوصول لمنطق والتعامل مع هذا الCubit  والذي
    هو الCounterCubit وبالتالي لابد من نحط الويدجيت الاب او الجد لل HomePage او غيرها ..
    وهنا عندنا الاب لها هو ال MaterialApp وبالتالي نجعلها child ونحطها
    بداخل الBlocProvider

    والان يمكننا الوصول في الHomePage فقط للمنطق التابع لل CounterCubit


    خلاصة لكي يتعامل اي صفحة ui مع المنطق الذي هو صفحة ال cubit لابد من تعريف صفحة الcubit
    في الBlocProvider الذي سيكون بداخلها الويدجيت الاب لهذه صفحة ال ui
     */

    //1-Counter example
    // BlocProvider(create: (context) => CounterCubit(),
    //
    //   child:   MaterialApp(
    //
    //     home: HomePage(),))

    //2-Api example


      // BlocProvider(create: (context)=>PostsBloc()  ,
      //   child: MaterialApp(
      //
      //     home: PostPage(),),
      //
      // )


      BlocProvider(create: (context)=>PostsCubit()  ,
    child: MaterialApp(

          home: PostPage(),),

    )

   );
}

