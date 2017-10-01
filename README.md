# xcode9navigationissue
Xcode 9 navigation issue after navigating from left side menu

In support of this stackowerflow question: https://stackoverflow.com/questions/46491327/xcode-9-navigation-bar-issue-after-navigating-from-left-side-menu-on-ios-11-not

After updating from Xcode 8 to Xcode 9 I've noticed this very strange behaviour in the navigation bar only on devices running iOS 11.

This bug appears after navigating from my left side menu that show the menu controller you choose modally with a default presentation (That is Full Screen)

I've post a video here: https://youtu.be/mgjlbkMi-N8

It seems a bug of the compilation on Xcode 9.

Tryed also on real device iPad Pro with iOS 11. 
The same code compiled with Xcode 8.3.3 works as expected, while compiled with Xcode 9 exposes the issue.

I've put a playground code here: https://github.com/shadowsheep1/xcode9navigationissue

With already a workaround: set the presentation to Over Full Screen.

But that has no meaning this is not the exptected operation.

Once the navigation bar is broken, is broken for every navigation controller in the App. O_O

Any idea?
