	
project:
	tuist clean
	tuist install
	tuist generate --no-open
#	pod install
	open Tuist-Demo.xcworkspace
g:
	tuist generate --no-open
#	pod install
e:
	tuist edit
o:
	tuist generate --no-open
#	pod install
	open Tuist-Demo.xcworkspace
