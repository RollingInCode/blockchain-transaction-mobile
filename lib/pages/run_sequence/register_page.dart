
import 'package:blockchain_app/pages/login_screen/login_screen.dart';
import 'package:blockchain_app/pages/utilities/get_api.dart';
import 'package:blockchain_app/pages/utilities/global_data.dart';
import 'package:blockchain_app/pages/run_sequence/verify_user.dart';


// import 'package:fitness_app_development/pages/login_page.dart';
// import 'package:fitness_app_development/pages/login_screen/login_screen.dart';
// import 'package:fitness_app_development/pages/verify_user.dart';
// import 'package:fitness_app_development/utilities/global_data.dart';
// import 'package:fitness_app_development/utilities/get_api.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passController = TextEditingController();
  final rfnController = TextEditingController();
  final rlnController = TextEditingController();
  final pController = TextEditingController();
  final addController = TextEditingController();
  final cnController = TextEditingController();


  String email = '';
  String login = '';
  String password = '';
  String repFirstName = '';
  String repLastName = '';
  String companyName = '';
  String companyAddress = '';
  String position = '';




  late Map<String, dynamic> decodedToken;


  @override
  void dispose(){
    emailController.dispose();
    userNameController.dispose();
    passController.dispose();
    rfnController.dispose();
    rlnController.dispose();
    pController.dispose();
    cnController.dispose();
    addController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://www.verywellfit.com/thmb/LeBe7RNtzbJwyKRmH8ditmJ1NKg=/1500x1020/filters:no_upscale():max_bytes(150000):strip_icc()/Snapwire-Running-27-66babd0b2be44d9595f99d03fd5827fd.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.blue,
                    width: 8,
                  )
              ),
            ),
            Container(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height) * .2, horizontal: (MediaQuery.of(context).size.width) * .1),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),

                    SizedBox(height: 30.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',

                      ),
                    ),

                    SizedBox(height: 15.0),
                    TextField(
                      controller: passController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: cnController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company Name',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: rfnController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Rep First Name',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: rlnController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Rep Last Name',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: pController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Position/Job',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextField(
                      controller: addController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Business Address',
                      ),
                    ),
                    SizedBox(height: 15.0),

                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        ElevatedButton(

                          onPressed: () async {

                            email = emailController.text;
                            login = userNameController.text;
                            password = passController.text;
                            repFirstName = rfnController.text;
                            repLastName = rlnController.text;
                            companyName = cnController.text;
                            companyAddress = addController.text;
                            position = pController.text;



                            try{
                              int ret = await GetAPI.register(email, repFirstName, repLastName, login, password, companyAddress, companyName, position);
                              GlobalData.userName = login;
                              GlobalData.lastName = repLastName;
                              GlobalData.firstName = repFirstName;
                              GlobalData.email = email;
                              GlobalData.companyAddress = companyAddress;
                              GlobalData.companyName = companyName;
                              GlobalData.position = position;

                              if(ret == 200) {
                                print('Register Successful');

                              }
                              else print('Error');


                            }
                            catch(e){
                              print(e);
                              return;
                            }



                            try {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Verify()));
                            }catch(e){
                              print(e);
                            }

                          },
                          child: Text('Register'),
                        ),
                        TextButton(

                          onPressed: () {

                            try {
                              emailController.clear();
                              userNameController.clear();
                              passController.clear();
                              rfnController.clear();
                              rlnController.clear();
                              cnController.clear();
                              addController.clear();
                              pController.clear();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            }catch(e){
                              print(e);
                            }

                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),



                  ],
                ),
              ),

            ),
          ],
        )
    );
  }

}
