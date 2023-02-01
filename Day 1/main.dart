import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF006387),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>(); // ممكن تتجاهل المتغير هذا بشرحه

  /// بالمتغير هذا راح نحفظ التصميم للصندوق عشان مانعيد الخطوات لاننا راح نستعمله لكل الفيلدز(ايميل , باسورد) مثل لاين97 ولاين 113
  var textInputDecoration = const InputDecoration(
    //
    //
    // هنا لون ايطار الفيلد اذا المستخدم فتح الكيبورد ويستعمل الفيلدز
    focusedBorder: OutlineInputBorder(
        //
        borderSide: BorderSide(
      color: Color(0xFF006387),
      width: 2,
    )),

    // هنا نفس الشيء ونفس شكل الايطار لكن اذا الفيلد مايكتب فيه
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF006387), width: 2),
    ),

    // وهنا شكل الايطار اذا كان فيه خطأ بمدخلات المستخدم ولونه بيكون احمر
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الويدجت اللي تحت اللي اسمها سنقل تشايلد تستعمل عشان تخلي الشاشه سكرول يعني لو الجوال صغير مثلا ومايكفي يطلع كل المحتوى بالشاشه تقدر ببساطه تنزل تحت وتشوف المحتوى
      body: SingleChildScrollView(
        //
        // البادينق ويدجت تحت عشان تحط مسافه حول الفورم تقدر تغير بالقيم (80 ولا 20) عشان تفهم تأثيرها
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
              key: formKey,
              // هذا الكولم الاساسي لنا وهو المسؤول انه يعرض المحتوى بشكل افقي (من فوق لتحت))
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // هنا بادنق ثاني تقدر تغير القيم (10, 40) عشان تفهم تأثيرها
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 40),
                    // هنا نعرض اللوقو باستعمال ويجدت الصور ولو تلاحظ اننا حيطنا العرض 200 عشان نعرضها بالحكم اللي يناسبنا حط 100 وشف الفرق
                    child: Image.asset(
                      "assets/login.png",
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 29,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // هنا الفيلد حق الايميل لو تلاحظون باول خاصيه استعملنا المتغير اللي فوق عشان الشكل وكملنا باستعمال كوبي ويذ عشان نحط العناصر الخاصه باالايميل
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                        // هذا المسؤول عن شكل الكتابه اللي داخل الفيلد لو تلاحظ ان اللون رمادي وبولد
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                  // هذا يخلق مسافه بين الفيلدز بارتفاع 15 بيكسل غير وشف الفرق
                  const SizedBox(height: 15),

                  // هنا فيلد الباسوورد نفس الايميل لكن حطينا ترو لاول خاصيه وهي مسؤوله عن ان الكتابه تظهر ولا لا وطبعا غيرنا الليبل والايقونه
                  TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                  const SizedBox(height: 20),
                  // هنا لو تلاحظ التشايلد حق الويدجت هو الزر والبوكس ويدجت تعتبر كانها حاويه وحطينا عرضها الى نهاية الشاشه
                  SizedBox(
                    // هنا تقدر تتحكم بالعرض جرب تغير الخاصيه اللي تحت اللاين هذا ب 150 مثلا وشف الفرق
                    width: double.infinity,
                    // هذي هي ويدجت الزر وفيها خصائص كثير حاول تستكشفهم
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                // هنا جرب تغير ال 30 الى 0 و بتفهم طريقته
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          "Log In",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed:
                            () {}), // هنا زي ماهو واضح اذا المستخدم ضغط الزر وش نسوي؟ داخل ال {} راح نكتب وش نبي يصير
                  ),

                  // زي ماقلنا مسافه بطول 10 بكسلز بين الزر والكتابه اللي تحت
                  const SizedBox(height: 10),

                  // طيب هذي اخر ويدجت اللي هو الكلام اللي تحت الزر طيب ليش استعملنا الويدجت هذا بدال التيكست العادي؟ لاننا نبي نعطي الجمله ستايلين مختلفات عشان المستخدم يفهم ان اللي تحته خط ينضغط ويوديه لشاشه ثانيه
                  Text.rich(TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Register here",
                          style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () {}), // برضو بيمن {} نكتب وش نبي نسوي اذا المستخدم ضغط اللي تحت خط واللي هو نرسله لصفحة التسجيل
                    ],
                  )),
                ],
              )),
        ),
      ),
    );
  }

  login() async {
    return true;
  }
}
// image

// text

//form 1
//form

// button
//text
