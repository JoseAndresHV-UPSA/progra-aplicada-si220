# user_app

Segunda app creada con flutter.

## Acerca de la App

Esta siguiente aplicación sirve para hacer una consulta [GET] por id y obtener información de una API de prueba que nos trae los datos de un user en formato JSON. Esta información es transformada a un objeto y es representada en un TextFormField para cada atributo del user.

API de Users: https://jsonplaceholder.typicode.com/users/{id}

## Documentación utilizada
Flutter Cookbook: https://esflutter.dev/docs/cookbook
Obtener datos desde internet: https://esflutter.dev/docs/cookbook/networking/fetch-data

## Pasos utilizados para la creación de la App
1. Abrir Visual Studio Code y crear un nuevo proyecto (Command Palette -> New Flutter Project)
2. Borrar el contenido de ejemplo en main.dart
3. Construir el main() y llamar al runApp
4. Crear un StatelessWidget (stless [tab] y colocar nombre "MyApp")
5. Cambiar el return Container por MaterialApp y agregar title y home
6. Crear un StatefulWidget (stful [tab] y colocar nombre "Home")
7. Cambiar el return Container por Scaffold y agregar appBar y body
8. Crear un nuevo archivo llamado user.dart
9. Crear la clase modelo "User" con sus atributos, constructor y método para transformar json al objeto
10. Crear un nuevo archivo llamado address.dart
11. Crear la clase modelo "Address" con sus atributos, constructor y método para transformar json al objeto
12. Crear un nuevo archivo llamado company.dart
13. Crear la clase modelo "Company" con sus atributos, constructor y método para transformar json al objeto
14. Agregar todos los TextEditingController necesarios por cada dato de User a mostrar
15. Crear el metodo que la información getData(id), hace la consulta al API (por id) y actualiza los valores de los TextEditingController
16. Crear el ListView donde se mostrará la información
14. Crear el TextFormField de consulta (id)
15. Crear el botón ElevatedButton que llamará método de consulta
16. Crear todos los TextFormField necesarios para cada campo de la información a mostrar
  
