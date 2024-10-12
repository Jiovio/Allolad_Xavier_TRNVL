import 'package:allolab/Components/AppBar.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Patient/PatientDetails.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientlistScreen extends StatefulWidget {
  const PatientlistScreen({Key? key}) : super(key: key);

  @override
  _PatientlistScreenState createState() => _PatientlistScreenState();
}

class _PatientlistScreenState extends State<PatientlistScreen> {
  late Future<List<Map<String, dynamic>>> _patientsFuture;
  String _searchQuery = '';
  List<Map<String, dynamic>> _allPatients = [];

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    _allPatients = await getLocalPatients();
    setState(() {
      _patientsFuture = Future.value(_allPatients);
    });
  }

  List<Map<String, dynamic>> _filterPatients(List<Map<String, dynamic>> patients) {
    if (_searchQuery.isEmpty) {
      return patients;
    }
    return patients.where((patient) =>
        patient['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Patient List".tr,
        Context: context,
        Color: Black,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Black, width: 1.0),
                ),
                prefixIcon: Icon(Icons.search_rounded),
                labelText: 'Search Patient By Name'.tr,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _patientsFuture = Future.value(_filterPatients(_allPatients));
                });
              },
            ),
            SizedBox(height: 15),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: getLocalPatients(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No patients found'.tr));
                  } else {
                    final filteredPatients = snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: () async {
                        await _loadPatients();
                      },
                      child: ListView.separated(
                        itemCount: filteredPatients.length,
                        separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: Colors.black54,
                          height: 0,
                        ),
                        itemBuilder: (context, index) {
                          final patient = filteredPatients[index];
                          return ListTile(
                            leading: SizedBox(
                              height: 45,
                              child: Image.network(
                                "https://cdn-icons-png.flaticon.com/512/1533/1533506.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(patient['name'] ?? ''),
                            subtitle: Row(
                              children: [
                                Text("Patient ID: ".tr),
                                Text(
                                  "${patient['uid']}",
                                  style: TextStyle(
                                    color: PrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_right_outlined,
                              color: PrimaryColor,
                            ),
                            onTap: () {
                              Get.to(
                                () => PatientDetails(
                                  id: patient['uid'],
                                  name: patient['name'] ?? '',
                                ),
                                transition: Transition.rightToLeft,
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}