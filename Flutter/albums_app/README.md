# albums_app

Primer app creada con flutter.

## Acerca de la App

Esta primer aplicación sirve para hacer [GET] y obtener información de una API de prueba que nos trae un listado de álbumes en formato JSON. Esta información es transformada a una lista que es representada en un ListView donde los atributos de cada álbum se muestra en un ListTile.

API de Albums: https://jsonplaceholder.typicode.com/albums/

## Documentación utilizada
Flutter Cookbook: https://esflutter.dev/docs/cookbook
Obtener datos desde internet: https://esflutter.dev/docs/cookbook/networking/fetch-data

## Pasos utilizados para la creación de la App
1. Abrir Visual Studio Code y crear un nuevo proyecto (Command Palette -> New Flutter Project)
2. Borrar el contenido de ejemplo en main.dart
3. Construir el main() 
4. Crear un StatelessWidget (stless [tab] y colocar nombre "MyApp")
5. Cambiar el return Container por MaterialApp y agregar title y home
6. Crear un StatefulWidget (stful [tab] y colocar nombre "Home")
7. Cambiar el return Container por Scaffold y agregar appBar y body
8. Crear un nuevo archivo llamado album.dart
9. Crear la clase modelo "Album" con sus atributos, constructor y método para transformar json al objeto
10. Crear un nuevo archivo llamado api_service.dart
11. Crear la clase ApiService con un URL del API como atributo y el método que recibe la información del API y retorna la lista de Albums
12. Crear un objeto ApiService y un List<Album> dentro del _HomeState
13. Agregar el método initState y hacer el consumo del AppService para obtener la información y mandarla a la lista de Albums
14. Crear el FutureBuilder dentro del body y agregar future como la lista de Albums
15. Crear y retornar un ListView.builder para poder construir la información en forma de lista
16. Crear y retornar un ListTile para poder representar la información de cada Album
  
