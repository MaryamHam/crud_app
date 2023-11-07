import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var firstNameCotroller = TextEditingController();
  var lastNameCotroller = TextEditingController();
  var addressCotroller = TextEditingController();


  //add
  void addUser() {

     emit(LoadingAddState());
  
  
     firestore.collection("Users").add({

          "firstName": firstNameCotroller.text,
          "lastName":lastNameCotroller.text,
          "address": addressCotroller.text,


        }).then((value){
          
        firestore.collection("Users").doc(value.id).update(
          {
             
             "id":value.id,
          }
        );

        emit(SuccesAddState());
        }).catchError((error){
    
            print(error);
            emit(ErrorAddState());

   });
        


  }



  //get

   List<DocumentSnapshot> userDocuments = [];
  
    void getUser() async{

      emit(LoadingGetState());
         QuerySnapshot querySnapshotAd = await firestore.collection("Users").get();

        if(querySnapshotAd == null){
          emit(ErrorGetState());

        }else{

        userDocuments =  querySnapshotAd.docs;
        userDocuments.forEach((doc) {
          print(doc.data());

        });
        emit(SuccesGetState());

    }

    }


    //get User
 
    Map<String,dynamic> userData = {};

    void getOneUser(String id){
      emit(LoadingGetUserState());
        firestore.collection("Users").doc(id).get().then((value) {

       userData = value.data() as Map<String, dynamic>;
           
          userData["firstName"] = firstNameCotroller.text;
          userData["lastName"] =lastNameCotroller.text;
          userData["address"] = addressCotroller.text;

           emit(SuccesGetUserState());

        }).catchError((error){

         emit(ErrorGetUserState());
        });

    }



    //update
    void updateUser(String id){

      emit(LoadingUpdateState());
   
      if(id == null){
        emit(ErrorUpdateState());
      
      }else{
       firestore.collection("Users").doc(id).update({
        "firstName": firstNameCotroller.text,
        "lastName" : lastNameCotroller.text,
        "address": addressCotroller.text,
       });

       emit(SuccesUpdateState());

      }

    }


      //update
    void detetUser(String id){

      emit(LoadingDeleteState());
   
      if(id == null){
        emit(ErrorDeleteState());
      
      }else{
       firestore.collection("Users").doc(id).delete();

       emit(SuccesDeleteState());

      }

    }


}
