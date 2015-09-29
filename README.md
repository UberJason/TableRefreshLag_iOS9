# TableRefreshLag_iOS9
A quick project to demonstrate table section refresh lag in iOS 9

In iOS 9, there seems to be animation framerate issues / lag when calling ```refreshSections:withRowAnimation:```, which is accentuated when it is called multiple times.

I ran this project on an iPhone 6 running iOS 8.4.1, and on an iPhone 6S running iOS 9.0.1. Despite the superior hardware of the iPhone 6S, the animation is visibly and notably smoother on the iPhone 6 running iOS 8, and is noticeably laggy on the iPhone 6S running iOS 9.
