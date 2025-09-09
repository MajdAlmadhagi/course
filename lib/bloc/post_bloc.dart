//ال bloc تتكون من ثلاث صفحات وهي تستخدم للمشاريع المتوسطه والضخمه على عكس cubit تستخدم للصغيرة الى المتوسطة

//هنا يتم عمل المنطق
import 'package:bloc_course/bloc/post_event.dart';
import 'package:bloc_course/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class PostsBloc extends Bloc<PostsEvent,PostsState> {
  PostsBloc() :super(LoadingState()){

    //function for this Event
    on<FetchPostsEvent>((event,emit) async{//هنا نحط منطق الEvent الذي قمنا بتعريفه وهي نقدر نقول عنه مثل دالة الFetchPosts التي في ال cubit




      //اولا عند طلب جلب الposts قم بتنفيذ الانتظار ..اي يتم عمل اعادة بناء الجزء المستمع واظهار loading
      emit(LoadingState());

      //ثانيا نأخذ البيانات من الapi ونفك تشفيرها للجلب

      try{
        //https://jsonplaceholder.typicode.com/posts
        final response= await http.get(Uri.parse('https://fakestoreapi.com/products'));//متغير يخزن الاستجابه ..بحالتها هل 200 ام لا - بمحتواها وغيره


        if(response.statusCode==200){//اذا كان الاتصال او الاستجابة للapi ناجحه 200

          final List Posts=json.decode(response.body);//فك تشفير محتوى الاستجابة من json الى dart

          emit(LoadedState(Posts));//بعد ما حصلنا على البيانات او محتوى الاستجابة نقوم بعمل اعادة بناء للجزء المستمع بأظهار هذه البيانات ..من خلال تمريرها الى الحاله LoadedState


        }
        else{
          print(response.headers);
        }





      }
      //يتم عمل اعادة بناء الجزء المستمع واظهار Error
      catch(e){//في حدوث خطأ غير متوقع مثلا في الانترنت
        emit(ErrorState("There Is an Error : $e"));
        print("There Is an Error : $e");

      }





    });


    //للcounter
    // on<IncrementCounterEvent>((event,emit){
    //
    //
    //
    // });
    //
    // on<DecrementCounterEvent>((event,emit){
    //
    //
    //
    // });

  }


}