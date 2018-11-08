# iOSOnlinePasswordGeneratorMobileApp
iOSOnlinePasswordGeneratorMobileApp

## Overview
This Mobile app enables users to select the number of password options to be generated
and the strength of these passwords.

## The Mobile app consists of the fowllowing features:

### Password Setup View Controller 
1. This interface enables the user to select the number of passwords to be generated
and the length of these passwords. This view controller is embedded on a
navigation controller to provide the transition to the Passwords list View Controller.
2. Upon clicking the “Create Passwords” button, the app does the validation to check if the user has
entered a valid number of passwords and has selected a strength level (length). If
any input is missing, the app displays an alert dialog indicating the error, else the app
transitions to the Passwords list ViewController and passes the required data. 

### Password Setup View Controller
1. This view controller generates the passwords list which are created in
the background in a child thread. Then the result is passed to the main thread
and displayed on the Table View.
2. Upon selecting a password from the list, the view controller will transition back to
the previous view controller and display the selected password in the Password
Setup view controller.
