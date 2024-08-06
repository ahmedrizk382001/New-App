import 'package:flutter/material.dart';

Widget generateNews(String url, String title, String author, String time,
    BuildContext context) {
  return Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(url),
            scale: 1,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
          child: Container(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )),
            Text(
              author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ))
    ],
  );
}

Widget getDivider(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 15,
      bottom: 15,
    ),
    child: Container(
      height: 1.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}

Widget builtTextFormField(
  BuildContext context, {
  TextInputType keyboardtype = TextInputType.text,
  required String? Function(String?) validatorFunc,
  required String labelText,
  required Widget prefixIcon,
  void Function()? onTap,
  void Function(String)? onChanged,
  required TextEditingController? controller,
}) =>
    TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardtype,
      validator: validatorFunc,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 237, 185, 14),
            ),
            borderRadius: BorderRadius.circular(15)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        hintMaxLines: 1,
        prefixIcon: prefixIcon,
      ),
    );
