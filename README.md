
# Traqa 

Traqa is a simple order tracking app that makes use of [Firebase Auth](https://console.firebase.google.com/u/0/) and the [Ably Realtime](https://ably.com/) services. It provides a seamless user interaction and an aesthetically pleasing interface.
## Preview

https://github.com/fiki2002/traqa/assets/85044009/ff28edde-6a34-4353-a8c9-8bac7c7d504d

You can also view the android and iOS previews here:

Android: https://drive.google.com/file/d/1N_sxPCiFtC7HLcqHDW9PfEfcIQYolD6j/view?usp=sharing

iOS: https://drive.google.com/file/d/1K2hJRnw4_xTi4WyjQH3gaH5XVAlGAvnK/view?usp=sharing

## Demo Link

https://drive.google.com/file/d/14v3uv-ysvs4gMX-l9_1KgSDg6_5YJDg9/view?usp=sharing

## Key Features

- Sign in with Google
- Persistent sign in
- Realtime order tracking

## Installation

 - You can download the apk to your Android device from [here](https://drive.google.com/file/d/1q0A9_E7Q_yh2pIhFKnSAzrbcE8IlUcL-/view?usp=sharing)

 To run **Traqa** from the Codebase,
 you need to get an ABLY API key from [here](https://ably.com) you will have to create an account, if you don't have one.

Proceed to run `flutter pub get`, so as to fetch all dependencies.

```
flutter pub get

```

With all these in place, you can 

```dart

flutter run --dart-define=ABLY_API_KEY=YOUR-API-KEY

```

## How to send a message from Ably Dashboard

**NOTE:** To do this you can either have the [APK] (https://drive.google.com/file/d/1q0A9_E7Q_yh2pIhFKnSAzrbcE8IlUcL-/view?usp=sharing) or you already have the app running on your PC.

- Login into your [Ably Account](https://ably.com/)
- You should have an app created after login
  
  <img width="1341" alt="Screenshot 2024-04-21 at 12 57 51" src="https://github.com/fiki2002/traqa/assets/85044009/7976a934-10c4-4192-984b-2d9786781fed">

- Navigate to the Dev Console tab, like so

  <img width="1036" alt="Screenshot 2024-04-21 at 12 56 07" src="https://github.com/fiki2002/traqa/assets/85044009/4326542b-6f80-4f97-abc6-71ac6141028a">

- Locate the attach channel button, and enter `traqa`, which is the channel name for this project

<img width="1208" alt="Screenshot 2024-04-21 at 13 00 41" src="https://github.com/fiki2002/traqa/assets/85044009/bf4b24e8-bb76-4858-bb7a-93d01e719286">
  
- Find the publish message section and input the following possible order status 

<img width="1127" alt="Screenshot 2024-04-21 at 13 02 38" src="https://github.com/fiki2002/traqa/assets/85044009/ba339d36-02fa-49e7-8271-4f6ef1bcbeac">

  ```
  order_placed,
  order_accepted,
  order_pick_up_in_progress,
  order_on_the_way_to_customer,
  order_arrived,
  order_delivered
  ```

  where
  
  ``` dart
  switch (message) {
    case 'order_placed':
      return OrderStatus.orderPlaced;
    case 'order_accepted':
      return OrderStatus.orderAccepted;
    case 'order_pick_up_in_progress':
      return OrderStatus.orderPickUpInProgress;
    case 'order_on_the_way_to_customer':
      return OrderStatus.orderOnTheWayToCustomer;
    case 'order_arrived':
      return OrderStatus.orderArrived;
    case 'order_delivered':
      return OrderStatus.orderDelivered;
    default:
      return OrderStatus.unknown;
  }
  ```
  
into the **Message data** field, then proceed to publish.

Voila!, it would be updated on the app.
