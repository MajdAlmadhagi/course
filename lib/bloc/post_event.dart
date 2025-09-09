/*
//تكون هذه الصفحه فارغه لايوجد بها غير تعريف الحدث Event
ويتم اعطاء وظيفه لهذا الحدث في صفحة ال bloc
اي ترجع صفحة المنطق هي صفحة الbloc

في الbloc لايوجد functions بينما يوجد Events وهذا ال
event بدوره يحتوي على عمل او منطق الداله في صفحة ال bloc

حيث في صفحة ال ui يتم استدعاء الحدث مباشرة
 */

class PostsEvent {//الكلاس الاب الذي سوف يتم التعامل من خلاله




}

class FetchPostsEvent extends PostsEvent{//بدلا من اسم الدالة التي كانت في ال cubit يتم تعريفها مع منطقها بينما هنا نعمل تعريف للحدث فقط


}


//اذا كنا نشتي نعمل احداث لل counter
// class IncrementCounter extends CounterEvent{
//
//
//
// }
//
// class DecrementCounter extends CounterEvent{
//
//
//
// }