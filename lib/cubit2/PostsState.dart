import 'package:equatable/equatable.dart';

/*
يمكننا المقارنه بين String&String و int&int ايضا بين ال objects
لكن بين ال objects تكون النتيجة false بشكل افتراضي حتى لو كانت المقارنة صحيحة

لكن مع Equatable المخصصه للمقارنة بين ال objects فأن تلك المكشله يتم تفاديها

حيث ان الغرض منها هو تحسين الاداء وهذا مثلا عند وجود تشابه بين
القيمه الاولى في الكائن1 والقيمه الثانيه في الكائن 2 لا يتم عمل rebuild للشاشة او للجزء المستمع
اما في حال الاختلاف يقارن ويعمل rebuild


-بمجرد مايتم استدعاء الconstructor وتمرير قيمه له يتم انشاء كائن للكلاس نفسه
-تتم تمرير القيمه في صفحة ال cubit
 */

class PostsState extends Equatable {//نحطها عند الكلاس الاب فقط
  @override
  // TODO: implement props
  List<Object?> get props => [];//هنا فارغ لانه لايوجد متغير لمقارنته

}


//حالات التغيير المؤكد حدوثها

class LoadingState extends PostsState{

  //لن تحتوي على تعريف اي متغيير لانها مجرد علامة انتظار
}

class LoadedState extends PostsState{

  final List<dynamic> LoadedPosts; //List<Map> from api

  LoadedState(this.LoadedPosts);//سوف يتم تمرير قيمة لهذه الlist


  @override

  List<Object?> get props => [LoadedPosts];//هنا نحط المتغيرات التي سوف يتم مقارنة قيمها بين الكائنات من هذا الكلاس مثلا قيمة هذا المتغير في كائن 1 هي نفس قيمته في كائن2

}

class ErrorState extends PostsState{

  final String ErrorMessage;

  ErrorState(this.ErrorMessage);//سوف يتم تمرير قيمة نصية لهذه المتغير في صفحة الCubit مجرد مايتم استدعاء هذا ال Constructor



  @override

  List<Object?> get props => [ErrorMessage];


}