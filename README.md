# checkout_payment_app
Checkout Payment App is a mobile application developed using Flutter. It supports both Android and IOS.

Checkout Payment App is A payment Integretion app for Products are paid (Stripe - Paypal) .


## Table of contents
- ### [main packages used =>](#main-packages-used)
- ### [Folder structure =>](#folder-structure)
- ### [Demo video =>](#demo-video)

## Main packages used
 expandable_page_view: (For Expandable Page View That make hight and width is suitable fot item)
  fl_chart:(For Flow Chart)
  device_preview: (Display Application in Different apps )


## Folder structure
We have applied clean archeticture concept and here is the basic folder structure:

core folder structure that flutter provides:

```
responsive_dash_board
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

Here is the folder structure we have been using in this project:
```
lib
├── Features/checkout
├── core
└── main.dart
```


### core
This folder containes :
1) (errors-> for handling errors ).
2) (utils -> for services that are used in application ).
3) (widgets -> for widgets that are used in application)
```
core
 ├── errors
 ├── utils
 ├── widgets 
```                       
### features
This folder containes :
1) (views->  everything related to the screen of the application).
2) (data -> for Models ).
```

features
   ├── checkout ├── data 
                ├── presentation                             
```
  ## data
  This folder containes :
  1) (models->  model of feature).
  2) (repos -> for repos and operation of feature ).
  ```
  
   data
     ├── models
     ├── repos                             
  ```
  ## presentation
  This folder containes :
  1) (manger-> contain that cubit or logic).
  2) (view -> contain on the ui or screen widets ).
  ```
  
   presentation
     ├── manger/cubit
     ├── view                             
  ```



## Demo Video



https://github.com/MohamedHussien991999/checkout_payment_app/assets/93053169/44fd5ce7-b500-4af0-8af1-840c5e55d9e5





