import 'package:crud_app/cubits/main/main_cubit.dart';
import 'package:crud_app/screens/users_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var cubit = MainCubit.get(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 155, 114, 114),
            title: Text(
              "Home",
            ),
            

            
            ),
  drawer: Drawer(
 
  child: ListView(
   
    // padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 155, 114, 114),
        ),
        child:CircleAvatar(
          backgroundImage: NetworkImage("https://cdn.create.vista.com/api/media/medium/70527291/stock-photo-old-camera-with-a-frame-hanging-on-the-wall?token="),
        )
      ),
      ListTile(
        title: const Text('Users List',style: TextStyle(color: Color.fromARGB(255, 155, 114, 114),fontSize: 18),),
        onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersDetailsScreen()));
        },
        trailing: Icon(Icons.list_alt_outlined),
      ),
     
    ],
  ),
),
          
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
                 
                if (state is SuccesAddState){
                        ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text(
                      "Add Successfully",
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.green,
                  ));

               Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersDetailsScreen()));


                }
            
                },
                builder: (context, state) {
                  return state is LoadingAddState?
                  Center(child: CircularProgressIndicator(),):
                  state is ErrorAddState?

                  Center(child: Text("Error"),):
                  
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .04,
                      ),
                      Text(
                        "Create An Account",
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "First Name",
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Last Name",
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
                          controller: cubit.addressCotroller,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Address",
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
                              cubit.addUser();
                            },
                            child: Text(
                              "Create",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
