# InterIntel Flutter Interview Test


## About the app

- The app has 4 pages/screens
 - Info page holds form that captures a user basic information. That is, name, email, phone number and a submit button.
 - Design screen acts as the user profile screen. Ita has user details captured in the info screen
 - Response screen makes a call to this api https://jsonplaceholder.typicode.com/todos?_limit=5 and the response displays the todos’ in a  list indicating the todo title and the completed value.
 - Dictionary screen

### How to run the app:
prerequisite - You need to have flutter and Android studio installed in your dev enviroment

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```