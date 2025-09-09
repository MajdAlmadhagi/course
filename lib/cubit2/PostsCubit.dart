import 'dart:convert';

import 'package:bloc_course/cubit2/PostsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostsCubit extends Cubit<PostsState>{
  PostsCubit(): super(LoadingState());//نمرر الحالة الابتدائية التي سوف تبدأ بها الصفحه

  //المنطق

  /*
  ملاحظة :
  يمكن تنفيذ كل الحالات بداخل نفس الدالة
  وليس بالشرط عمل دالة لكل حالة على حده ..مما يعني حسب الحاجه
   */

  Future FetchPosts()async{

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


  }





}