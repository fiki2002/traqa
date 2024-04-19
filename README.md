# Traqa

Please read the steps below

# How to set up the Project

Create a `keys.dart` file in the `/lib/core/utils/`folder 

``` dart

const String _ablyApiKey =
    'TMhTAA.a_X_9Q:...';

String get ablyApiKey => _ablyApiKey;

```
And that's all that is needed!

# How to send a message from Ably Console
- Make sure you have created an App already.
  
- Login to your Ably Dev Console and navigate to the `Dev Console` section

- Next scroll to the Channels section and click Add Channel.

  **Note:** Use the channel name `traqa` Please be sure you use the channel name `traqa` 

- Now that you have connected to the channel, the possible order status is below.
  ```
  order_placed,
  order_accepted,
  order_pick_up_in_progress,
  order_on_the_way_to_customer,
  order_arrived,
  order_delivered
  ```
  
  ``` dart
  switch (value) {
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
You can send any of the order statuses as a message by entering any one of them in the Message data field and clicking the publish Message button. 

You should be able to see the status update in real time in the app.

Link to APK: [Traqa](https://drive.google.com/file/d/1Loy8meIgCVeCQKoBt50-hCCpHCmMg9I6/view?usp=sharing)





































