# Movie App

*Group Project CSCI 4311 MOBILE APPLICATION DEVELOPMENT*


**Group members:**

|                  Name                         |    Matric No. | 
|:----------------------------------------------|:-------------:|
| USMAN SENG                                    |    1611579    |Cancel changes
| MUHAMMAD ZAFRAN CHAI BIN MUHAMMAD JEFFRY CHAI |    1710003    |
| AHMAD HUZAIFI BIN AHMAD AZAHRI                |    1918091    |
| HASSAN FURQAN SAID                            |    1724546    |




**Project Summary:**

This project is intended to be a great resource for movie aficionados as well as a helpful resource for anyone looking for a decent movie to watch. To get a list of movies, the project uses the IMDb API (https://rapidapi.com/SAdrian/api/data-imdb1/). The app is  composed of three screens: 2020 movies, popular movies, and Favorites. When the app first launches, it prompts the user to login their account if they don't have an account they can click on register to create an account. The 2020 movies page uses the IMDb API to pull a list of 2020 movies. The image URL retrieved from the API is used to display each movie as a poster. You can add a movie as a favourite by tapping on the 🖤 icon, and then go to the Favorites tab to see a list of your favourites.



**Project Objective:**

* Assist users to find interesting movies easier.
* Help users to know popular movies easily. 
* Assit users to save their favorite movies.



**Screen Details**

| Screen        | Functionality | 
|:--------------|:-------------:|
|               |               |
|    <img src="https://user-images.githubusercontent.com/55779908/152355017-26368ef6-75e1-499e-a1be-12fbd2c93605.png" width="170" height="250">  | **Sign in Screen:** This is the application's landing screen. The user will be able to login in with an existing credential or create a new accounted which is hosted on Firebase. |
|    <img src="https://user-images.githubusercontent.com/55779908/152355175-ee339725-bad4-44b0-ac67-2cacd68093b0.png" width="170" height="250">  | **Signup Screen:** The user can create a new  account on this screen, and the credentials will be pushed to the Firebase authentication storage. |
|    <img src="https://user-images.githubusercontent.com/55779908/152355356-31281ead-ad9e-4a29-84fe-31e813e5f08b.png" width="170" height="250">  | **2020 Movies Screen:** This screen provides a list of 2020 Movies that users can later add to their bucket list. Each movie has their poster, Genre, Rating, content and Length |
|    <img src="https://user-images.githubusercontent.com/55779908/152361009-58eb988b-237a-40a8-b2fe-8ee9043e3cde.png" width="170" height="250">  | **Popular Movies Screen:** In this screen, the user will be able to view the popular Movies. |
|    <img src="https://user-images.githubusercontent.com/55779908/152355492-23baf645-ee58-4429-bf87-89485c99d374.png" width="170" height="250">  | **My Bucket list**  | In this screen, the user will be able to view the movies that they have added to their bucket list |



**Instructions**

1. Clone the repository 
```
$ git clone https://github.com/ujaiahmad/flutter_movie_app.git
```
2. Change directory
```
$ cd flutter_movie_app
```
3. Fetch Dependencies from pubspec.yaml
```
$ flutter pub get
```
4. Run the App
```
$ flutter run
```
