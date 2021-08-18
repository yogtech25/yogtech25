# iOSCaseStudy

iOSCaseStudy is a mobile app for show itunes search list and its details.

## Features
- List: Show itunes apple search list using [Search API](https://itunes.apple.com/search?term=jack+johnson&imit=100")
- Use MVVM architecture
- Detail screen for itunes item
- User can delete particular itunes item on details screen.
- Unit test cases
- UI test cases

# How did you decide to use that design and architectural patterns?
Its depend on projects which architectural we can use but now curretly higly used architectural is MVVM and VIPER. Now some details MVVM 
- The MVVM is very attractive, since it combines benefits of the aforementioned approaches, and, in addition, it doesn’t require extra code for the View updates due to the bindings on the View side. Nevertheless, testability is still on a good level.
- It is basically UIKit independent representation of your View and its state. The View Model invokes changes in the Model and updates itself with the updated Model, and since we have a binding between the View and the View Model, the first is updated accordingly.

# What should be the part of this app that needs more time to develop or improve?
Delete itunes item part on details screen and after update list on main screen data. that's take more time to development.

# Does this app ready to submit to store? If not, what should be done to achieve that?
Yes, Its ready for upload app store. You need to apple developer account (https://developer.apple.com/)

# Any assumptions/comments/notes about any particular decision?
No

# What are the things you think are missing or open in this assignment?
No, According to document we have cover all task.

# Does your project require any particular tool to be able to run?
Yes, We need to run this project on xcode(https://developer.apple.com/xcode/)


## Tech
- [Xcode] - Xcode need to run appliction
- [Swift] - Swift-5 used for app development 
- [Unit Test Case] - On code available unit test cases
- [UI Test Case] - On code available UI test cases


## Installation
- iOSCaseStudy requires [Xcode12](https://developer.apple.com/xcode/) v12+ to run.
- Use github [iOSCaseStudy](https://github.com/yogtech25/yogtech25) link for download app code.
- After download project open iOSCaseStudy/iOSCaseStudy.xcodeproj in xcode
- Run this app using xcode

