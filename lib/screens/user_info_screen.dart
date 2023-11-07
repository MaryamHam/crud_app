import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/cubits/main/main_cubit.dart';
import 'package:crud_app/screens/home_screen.dart';
import 'package:crud_app/screens/users_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoScreen extends StatefulWidget {
  UserInfoScreen({super.key, required this.item});

  DocumentSnapshot item;

//  required this.id
//  String id;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  @override
  void initState() {
    
    MainCubit.get(context).getOneUser(widget.item["id"]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);

    cubit.firstNameCotroller.text = widget.item["firstName"];
    cubit.lastNameCotroller.text = widget.item["lastName"];
    cubit.addressCotroller.text = widget.item["address"];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 155, 114, 114),
          title: Text(
            "User Information",
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width * .8,
            height: MediaQuery.sizeOf(context).height * .56,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 243, 234, 234),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 191, 169, 169),
                    offset: Offset(2, 5),
                    blurRadius: 10),
                BoxShadow(
                    color: Color.fromARGB(255, 191, 169, 169),
                    offset: Offset(-2, -5),
                    blurRadius: 10),
              ],
            ),
            child: BlocConsumer<MainCubit, MainState>(
              listener: (context, state) {
                if (state is SuccesUpdateState){
                        ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text(
                      "Update Successfully",
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.green,
                  ));

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersDetailsScreen()));
                }
              },
              builder: (context, state) {
                return state is LoadingUpdateState?
                  Center(child: CircularProgressIndicator(),):
                  state is ErrorUpdateState?

                  Center(child: Text("Error"),):

                 Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Text(
                      "Update User Info",
                      style: TextStyle(
                          color: Color.fromARGB(255, 116, 74, 74),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .06,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.sizeOf(context).width * .7,
                      height: MediaQuery.sizeOf(context).width * .12,
                      child: TextFormField(
                        controller: cubit.firstNameCotroller,
                        // controller: cubit.firstNameCotroller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          //  labelText: "First Name",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 74, 74)),
                          filled: true,
                          fillColor: Color.fromARGB(133, 190, 168, 168),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 74, 74),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 74, 74),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.sizeOf(context).width * .7,
                      height: MediaQuery.sizeOf(context).width * .12,
                      child: TextFormField(
                        controller: cubit.lastNameCotroller,
                        // controller: cubit.lastNameCotroller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          //labelText: "Last Name",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 74, 74)),
                          filled: true,
                          fillColor: Color.fromARGB(133, 190, 168, 168),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 74, 74),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 74, 74),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.sizeOf(context).width * .7,
                      height: MediaQuery.sizeOf(context).width * .12,
                      child: TextFormField(
                        // controller: cubit.addressCotroller,
                        controller: cubit.addressCotroller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration( 
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 74, 74)),
                          filled: true,
                          fillColor: Color.fromARGB(133, 190, 168, 168),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 74, 74),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 116, 74, 74),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height * .07,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * .6,
                        height: MediaQuery.sizeOf(context).width * .09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 116, 74, 74),
                        ),
                        child: MaterialButton(
                            onPressed: () {
                              cubit.updateUser(widget.item["id"]);
                            },
                            child: Text(
                              "Save Update",
                              style: TextStyle(color: Colors.white),
                            )),),

                    // Text(widget.item["firstName"]),
                    // Text(widget.item["id"])
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
