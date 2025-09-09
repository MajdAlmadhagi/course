//ال cubit تنقسم لصفحتين ..صفحة ال State وصفحة ال Cupit

//هذه الصفحه تعبر عن تغيير الحاله وبها نضع الحالات المتوقعه لميزه معينه
/*
مثلا للعداد الحالات سوف تكون : increment -decrement
لل feature صفحة المنتجات : loading-loaded-error
 */
class CounterState{//نحط فيه البيانات المتغيره في الصفحه التي سوف يتم عمل لها refresh في قيمتها اي هنا  المتغير counter
/*
فعلنا كلاسات الحالات ترث من هذا الكلاس
وهذا لانه عندما نقوم بأنشاء الكلاس CounterCubit لازم نعرفه لاي State بايتعامل فا
CounterState هذه بصفتها اب فهي تعبر عن كل الحالات التي ترثها

اي بأختصار يعتبر اسم العائلة لهم بشكل مبسط
سوف يتم التعبير او التعامل مع كلاسات الحالات عن طريق هذا
الكلاس الاب بما انهم وارثيين منه

 */

  final int counterA;//الجزء المتغير في الصفحه هنا فقط نفوم بتعريفه وفي صفحة ال cubit نقوم بتنفيذ المنطق عليه
////////////////////////
  final int counterB;
  final int counterC;


  CounterState(this.counterA,this.counterB,this.counterC);


}
//حالات التغير لل feature التي هي Counter

class IncrementState extends CounterState{
  IncrementState(super.counterA,super.counterB,super.counterC);//العدادت الموجود في الاب



}


class DecrementtState extends CounterState{
  DecrementtState(super.counterA,super.counterB,super.counterC);//العدادات الموجود في الاب



}