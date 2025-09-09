import 'package:bloc_course/cubit/CounterCubit.dart';
import 'package:bloc_course/cubit/CounterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    print("=============================");
    print("Whole page widgets rebuild");
    print("=============================");


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            //CounterA


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(onPressed: (){

                  //context.read<CounterCubit>().increment() for example one >> just one counter
                  context.read<CounterCubit>().increment('A');//تعليمه للوصول لما بداخل الCounterCubit اي للوصول للمنطق

                }, icon:Icon(Icons.add,size:40,)),


                BlocBuilder<CounterCubit,CounterState>(builder: (context, state) {//نحط BlocBuilder للجزء المتغير في الصفحه ولازم نعرف لها من الكلاسات الذي بايستمع لها

                  //هنا مجرد مايحدث تغيير في قيمة المتغير يقوم الemit الذي في الCounterCubit hاو في الكلاسات الحالات الابناء بعمل rebuild لهذا الجزء
                  //ايضا يتم عمل rebuild لكل الاجزاء التي تستمع لنفس الحاله الاب CounterStateو هذه مشكله بسيطه لها حل من خلال ال BlockSelctor
                  print("=============================");
                  print("Emit rebuild CounterA");
                  print("=============================");



                  if(state is IncrementState ){

                    return  Text("${state.counterA}",style:TextStyle(fontSize:30,color: Colors.green),);


                  }


                 else if(state is DecrementtState ){

                    return  Text("${state.counterA}",style:TextStyle(fontSize:30,color: Colors.red),);


                  }
                 else {return  Text("${state.counterA}",style:TextStyle(fontSize:30,color: Colors.black87),);}



                  //state  بمجرد تعريف  CounterState انه مستمع له ف من خلال state نصل لكل مافي الCounterState او نصل لكل من يرثه

                },),


                IconButton(onPressed: (){

                  //context.read<CounterCubit>().decrement() for example one
                  context.read<CounterCubit>().decrement('A');//تعليمه للوصول لما بداخل الCounterCubit اي للوصول للمنطق


                }, icon:Icon(Icons.remove,size:40))

              ],



            ),



            //CounterB

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(onPressed: (){

                  context.read<CounterCubit>().increment('B');//تعليمه للوصول لما بداخل الCounterCubit اي للوصول للمنطق

                }, icon:Icon(Icons.add,size:40,)),


                //BlocSelector من اجل ان لايتم اعادة بناء هذا الجزء في حال حدوث تحديث لجزء اخر بمجرد انه ينتمي  الحاله الاب  CounterState
                //فا من خلالها لايتم اعادة البناء الا اذا حصل تغيير في هذا الجزء المحدد والمعرف وهذا يحسن من اداء التطبيق
                BlocSelector<CounterCubit,CounterState,int>(//من الضروري ان نمرر فيه 3 انواع فالنوع الثالث نحدد فيه نوع القيمه التي تتغير وعندنا هو الCounterB

                  //selector من خلاله هنا نحدد الجزء الذي سيتم اعادة بناءه فقط والذي هو هنا CounterB من خلال state.nameOfVariable
                  selector:(state) {//state هي كائن من الكلاس CounterState للوصول لمتغيراته

                    return state.counterB;

                  },

                  builder: (context,counterB ) {//هنا بما انه قد حطينا الstate عند ال selector فلا  نكتبها فقط نكتفي بأسم المتغير بكل مكان كان يحتاج مننا عمل state.nameOfVariable

                  //هنا مجرد مايحدث تغيير في قيمة المتغير يقوم الemit الذي في الCounterCubit بعمل rebuild لهذا الجزء فقط
                  print("=============================");
                  print("Emit rebuild   CounterB");
                  print("=============================");



                  if(counterB is IncrementState ){

                    return  Text("${counterB}",style:TextStyle(fontSize:30,color: Colors.green),);


                  }


                  else if(counterB is DecrementtState ){

                    return  Text("${counterB}",style:TextStyle(fontSize:30,color: Colors.red),);


                  }
                  else {return  Text("${counterB}",style:TextStyle(fontSize:30,color: Colors.black87),);}



                  //state  بمجرد تعريف  CounterState انه مستمع له ف من خلال state نصل لكل مافي الCounterState او نصل لكل من يرثه

                },),


                IconButton(onPressed: (){

                  context.read<CounterCubit>().decrement('B');//تعليمه للوصول لما بداخل الCounterCubit اي للوصول للمنطق


                }, icon:Icon(Icons.remove,size:40))

              ],



            ),



            //CounterC

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(onPressed: (){

                  context.read<CounterCubit>().increment('C');//تعليمه للوصول لما بداخل الCounterCubit اي للوصول للمنطق

                }, icon:Icon(Icons.add,size:40,)),


                //BlocConsumer تعمل عمل الBlocListener,BlocBuilder
                BlocConsumer<CounterCubit,CounterState>(

                  listener: (context, state) {//تستمع لحالة التغيير وبناءا على هذا التغيير يتم اجراء حدث
                    if(state.counterC >6){

                      return print("CounterC is Grater than 6***");

                    }
                  },
                  builder: (context, state) {//نحط BlocBuilder للجزء المتغير في الصفحه ولازم نعرف لها من الكلاسات الذي بايستمع لها

                  //هنا مجرد مايحدث تغيير في قيمة المتغير يقوم الemit الذي في الCounterCubit بعمل rebuild لهذا الجزء فقط
                  print("=============================");
                  print("Emit rebuild   CounterC");
                  print("=============================");



                  if(state is IncrementState ){

                    return  Text("${state.counterC}",style:TextStyle(fontSize:30,color: Colors.green),);


                  }


                  else if(state is DecrementtState ){

                    return  Text("${state.counterC}",style:TextStyle(fontSize:30,color: Colors.red),);


                  }
                  else {return  Text("${state.counterC}",style:TextStyle(fontSize:30,color: Colors.black87),);}



                  //state  بمجرد تعريف  CounterState انه مستمع له ف من خلال state نصل لكل مافي الCounterState او نصل لكل من يرثه

                },),


                IconButton(onPressed: (){

                  context.read<CounterCubit>().decrement('C');//تعليمه للوصول لما بداخل الCounterCubit اي للوصول للمنطق


                }, icon:Icon(Icons.remove,size:40))

              ],



            ),













          ],
        ),


      ),
    );
  }
}
