import 'package:crud_app/cubits/main/main_cubit.dart';
import 'package:crud_app/screens/home_screen.dart';
import 'package:crud_app/screens/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersDetailsScreen extends StatefulWidget {
  const UsersDetailsScreen({super.key});

  @override
  State<UsersDetailsScreen> createState() => _UsersDetailsScreenState();
}

class _UsersDetailsScreenState extends State<UsersDetailsScreen> {
  @override
  void initState() {
    MainCubit.get(context).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 155, 114, 114),
            title: Text(
              "Users List",
            )),
        body: Center(
          child: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
                 if (state is SuccesDeleteState){
                        ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text(
                      "Delete Successfully",
                      style: TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.red,
                  ));

                  
                    Navigator.pop(context);
                }
            },
            builder: (context, state) {
              return state is LoadingGetState?
              Center(child: CircularProgressIndicator(),):
              state is ErrorGetState ?
              Center(child: Text("Error, please try again.!"),):
              
              ListView.builder(
                  // itemCount: 1,
                  itemCount: cubit.userDocuments.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      //  width: MediaQuery.sizeOf(context).width * .65,
                      height: MediaQuery.sizeOf(context).height * .1,
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

                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  Color.fromARGB(255, 116, 74, 74)
                          ),
                          child: Center(child: Icon(Icons.person,color: Colors.white,)),
                        ),
                        title: Text("${cubit.userDocuments[index]["firstName"] } ${cubit.userDocuments[index]["lastName"]}",style: TextStyle(color: Color.fromARGB(255, 116, 74, 74),fontWeight: FontWeight.bold),),
                        subtitle: Text(cubit.userDocuments[index]["address"] ,style: TextStyle(color: Color.fromARGB(255, 116, 74, 74),fontWeight: FontWeight.w400),),
                      
                      trailing: SizedBox(
                        width: MediaQuery.sizeOf(context).width* .24,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){

                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                 builder: (context) => 
                                 UserInfoScreen(item: cubit.userDocuments[index],
                                  // id: cubit.userDocuments[index]["id"]
                                  
                                  )
                                 ));

                      
                            }, icon: Icon(Icons.edit,color: Colors.grey,)),
                            IconButton(onPressed: (){
                             cubit.detetUser(cubit.userDocuments[index]["id"]);
                            }, icon: Icon(Icons.delete,color: const Color.fromARGB(255, 208, 133, 128),))
                          ],
                        ),
                      ),
                      
                      ),

                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
