import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                  Text(
                    'REGISTRASI DULU BRO',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.nama,
                          decoration: InputDecoration(
                            hintText: "Masukkan Nama",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Nama tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.username,
                          decoration: InputDecoration(
                            hintText: "Masukkan Username",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.password,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.telp,
                          decoration: InputDecoration(
                            hintText: "Masukkan Telepon",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Telepon tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.alamat,
                          decoration: InputDecoration(
                            hintText: "Masukkan Alamat",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Alamat tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        Obx(() => controller.loading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                          onPressed: () {
                            controller.addAkun();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text("Tambah Akun"),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: GestureDetector(
              onTap: () {
              },
              child: Text(
                'Copyright ©Meildy 2024',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}