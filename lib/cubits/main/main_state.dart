part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}


//add
 class ErrorAddState extends MainState{}
 class LoadingAddState extends MainState{}
 class SuccesAddState extends MainState{}


 //get
 class ErrorGetState extends MainState{}
 class LoadingGetState extends MainState{}
 class SuccesGetState extends MainState{}

  //get user
 class ErrorGetUserState extends MainState{}
 class LoadingGetUserState extends MainState{}
 class SuccesGetUserState extends MainState{}


  //update
 class ErrorUpdateState extends MainState{}
 class LoadingUpdateState extends MainState{}
 class SuccesUpdateState extends MainState{}


   //delete
 class ErrorDeleteState extends MainState{}
 class LoadingDeleteState extends MainState{}
 class SuccesDeleteState extends MainState{}