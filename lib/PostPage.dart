import 'package:bloc_course/bloc/post_bloc.dart';
import 'package:bloc_course/bloc/post_event.dart';
import 'package:bloc_course/cubit2/PostsCubit.dart';
import 'package:bloc_course/cubit2/PostsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {



  @override
  void initState() {
    //عند التعامل مع ال cubit  هنا نتعامل مع الدالة مباشرة
    // اضطرينا لاستخدام statful وهذا من اجل التمكن من استخدام هذه الدالة لكي تقوم بتنفيذ دالة الجلب اول ماتنفتح الصفحه
    context.read<PostsCubit>().FetchPosts();

    //عند التعامل مع الbloc هنا نتعامل مع الحدث
    //context.read<PostsBloc>().add(FetchPostsEvent());


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PostsCubit,PostsState>(builder:(context,state){


          if(state is LoadingState){//اذا كانت الحاله ولا شيء لا بيانات ولا خطأ رجع loading
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.blue ,));
          }
          else if (state is LoadedState){ //اذا كانت الحاله تم الجلب رجع البوستات

            return ListView.builder(
                itemCount: state.LoadedPosts.length,
                itemBuilder: (context,index){


                  return Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                          borderRadius:BorderRadius.circular(10),


                    ),
                    child: ListTile(


                      title:Text("${state.LoadedPosts[index]['title']}") ,
                      subtitle:Text("${state.LoadedPosts[index]['description']}") ,

                    ),
                  );




            });
          }

          else if (state is ErrorState){//مالم رجع الخطأ
            return Center(child: InkWell(
                onTap: (){     context.read<PostsCubit>().FetchPosts();
                },
                child: Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius:BorderRadius.circular(10),


                    ),


                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error,color: Colors.red,),
                        Text("${state.ErrorMessage}",style:TextStyle(fontSize:18),),
                      ],
                    ))));//ErrorMessage قد تم تمرير لها قيمه في صفحه ال cubit
          }

          else {return Text("");}



        }

        ),
      ),







    );
  }
}
