import 'package:bloc_course/cubit/CounterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ال cubit تنقسم لصفحتين ..صفحة ال State وصفحة ال Cupit

//هذه صفحة البيانات او بشكل ادق هي صفحة ال Business logic بما فيها من دوال تنفيذ للحاله وغيره

//CounterState يعبر عن حالتين من صفحة الstate
class CounterCubit extends Cubit<CounterState>{//بمعنى هذا الcubit يتعامل مع هذا الclass state المحدده
  CounterCubit(): super(CounterState(0,0,0));// هنا يتم تمرير الحالة الابتدائية مع القيمة الابتدائية للstate والذي هو عندنا المتغير counterA,B,C الاجزاء المتغيره



  // increment(){//example 1 => one counter
  //   //   يمكننا اعادة البناء واجراء التغيير من خلال الكلاس الاب وهذا في حال كان التغيير بسييط ويمكن للكلاس الاب التعبيير عن الحالات بدلا من تعريف كل حاله على حده emit(CounterState(state.counter +1));
  //   // emit(IncrementState(state.counterA +1));
  //
  //
  //
  // }


 //المنطق
increment(var CounterType){//عملت بارامتر وهذا لتقليل عدد الدوال بدلا من عمل دالتين زيادة ونقصان لكل عداد
  //   يمكننا اعادة البناء واجراء التغيير من خلال الكلاس الاب وهذا في حال كان التغيير بسييط ويمكن للكلاس الاب التعبيير عن الحالات بدلا من تعريف كل حاله على حده emit(CounterState(state.counter +1));
  // emit(IncrementState(state.counterA +1)); example 1 => one counter
  if(CounterType=='A'){

    emit(IncrementState(state.counterA +1, state.counterB, state.counterC));// 0+1 0 0 the initial state for every counter

  }

   else if(CounterType=='B'){

    emit(IncrementState(state.counterA, state.counterB +1, state.counterC));// 0 0+1 0 the initial state for every counter

  }

  else if(CounterType=='C'){

    emit(IncrementState(state.counterA, state.counterB, state.counterC +1));// 0 0 0+1 the initial state for every counter

  }





  /*

  وهنا يتم اعادة البناء من خلال الابن وهو المعبر عن الحاله مباشرتا وهذا يفضل اعادة البناء
   من خلاله اذا كان لدينا تغيير كبير مثلا تغيير في رقم العداد او لونه وهكذا
   اي بأختصار لكي نقوم بعمل شرط او اي اجراء في الui
   من خلال هذه الحاله المعينه بينما في الاب نتقيد
   مثلا:

   if(state is IncrementState){
   // return Text("")
   //
   }


   if(state is DecrementState){
   // return Text("")
   //
   }

   */

  /*
  emit
  عملها مثل ال setState
  اي تقوم بعمل  refresh او rebuild لل BlocBuilder الذي ينتمي او يستمع  لل  CounterState هذه التي بداخلها او ايا كان الذي بداخلها
   */

  // state.  للوصول لمتغيرات ال ClassState او صفحة الState وهنا هو الCounterState

}


// decrement(){
//
//   //  emit(CounterState(state.counter -1));
//   emit(DecrementtState(state.counterA -1));
//
//
//
// }

  decrement(var CounterType){


    if(CounterType=='A'){

      emit(IncrementState(state.counterA -1, state.counterB, state.counterC));// 0-1 0 0 the initial state for every counter

    }

    else if(CounterType=='B'){

      emit(IncrementState(state.counterA, state.counterB -1, state.counterC));// 0 0-1 0 the initial state for every counter

    }

    else if(CounterType=='C'){

      emit(IncrementState(state.counterA, state.counterB, state.counterC -1));// 0 0 0-1 the initial state for every counter

    }




  }


}