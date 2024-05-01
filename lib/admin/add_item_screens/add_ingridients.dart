import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taverna/cutouts/custom_text.dart';

class AddItemIngridients extends StatefulWidget {
  const AddItemIngridients({super.key});

  @override
  State<AddItemIngridients> createState() => _AddItemIngridientsState();
}

class _AddItemIngridientsState extends State<AddItemIngridients> {

  List<TextEditingController> _ingridientscontroller = [TextEditingController()];

  var formKey = GlobalKey<FormState>();

  final List<String> ingridientspostfix = [
    'литр','миллилитр',
    'грамм', 'миллиграмм', 'килограмм', 
    'столовая ложка', 'чайная ложка',
    'единица', 'щепотка',
  ];
  String? value;

  TextEditingController _ingridientsamountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 198, 166),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 216, 168, 127),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
             bottomRight: Radius.circular(15)
          )
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color.fromARGB(255, 61, 35, 14)
            )),
        centerTitle: true,
        title: Text(
          "Добавить позицию",
          style: CustomText.myTextStyleMedium(),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom:40.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ингридиенты",
              style: CustomText.myTextStyleLarge(),
            ),

            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _ingridientscontroller.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 186, 141),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: _ingridientscontroller[index],
                              autofocus: false,
                              style: const TextStyle(color: const Color.fromARGB(255, 139, 102, 89)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "ингридиент",
                                hintStyle: CustomText.myTextStyleHintText(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 60,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 236, 186, 141),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _ingridientsamountcontroller,
                            // controller: listController[index],
                            autofocus: false,
                            style: const TextStyle(color: const Color.fromARGB(255, 139, 102, 89)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "кол-во",
                              hintStyle: CustomText.myTextStyleSmall(),
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 10),
                        Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 240, 190, 146),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            itemHeight: null,
                            isExpanded: true,
                            items: ingridientspostfix
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: CustomText.myTextStyleSmall(),
                                    )
                                  )
                                ).toList(),
                            onChanged: ((value) => setState(() {this.value = value;})),
                            dropdownColor: const Color.fromARGB(255, 240, 190, 146),
                            value: value,
                          )),
                        ),


                        const SizedBox(width: 10),
                        index != 0
                            ? GestureDetector(
                              onTap: (){
                                setState(() {
                                  _ingridientscontroller[index].clear();
                                  _ingridientscontroller[index].dispose();
                                  _ingridientscontroller.removeAt(index);
                                });
                              },
                              child: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 121, 75, 38),
                                  size: 30,
                                ),
                            )
                            : const SizedBox()
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _ingridientscontroller.add(TextEditingController());
                  });
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 156, 112, 73),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("добавить",
                      style: GoogleFonts.cormorantGaramond(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: GestureDetector(
                onTap:() {
                  Navigator.pushNamed(context, '/adminAddItemInstructionsScreen');
                },
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 156, 112, 73),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Material(
                    color: Color.fromARGB(255, 156, 112, 73),
                    child: Form(
                      key: formKey,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Далее',
                                  style: GoogleFonts.cormorantGaramond(
                                    color: Colors.white70,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300),
                                ),
                                const Icon(
                                      size: 30,
                                      Icons.navigate_next,
                                      color:Colors.white70,
                                ),
                              ],
                            ),
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}