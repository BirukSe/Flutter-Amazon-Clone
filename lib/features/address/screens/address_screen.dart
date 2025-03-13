import 'package:e_comm/common/widgets/custom_button.dart';
import 'package:e_comm/common/widgets/custom_textfield.dart';
import 'package:e_comm/constants/global_variables.dart';
import 'package:e_comm/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
          )),
      body: Container(
        padding: EdgeInsets.all(8),
        color: GlobalVariables.backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (address.isNotEmpty)
                  Column(
                    children: [
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text(address, style: TextStyle(fontSize: 18)),
                          )),
                      SizedBox(height: 2),
                      Text('OR', style: TextStyle(fontSize: 18))
                    ],
                  ),
                Form(
                    key: _addressFormKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: flatBuildingController,
                          hintText: 'Flat, House no Building',
                        ),
                        SizedBox(height: 10),
                        CustomTextfield(
                          controller: areaController,
                          hintText: 'Area, Street',
                        ),
                        SizedBox(height: 10),
                        CustomTextfield(
                          controller: pincodeController,
                          hintText: 'Pincode',
                        ),
                        CustomTextfield(
                          controller: cityController,
                          hintText: 'Town/City',
                        ),
                        SizedBox(height: 10),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
