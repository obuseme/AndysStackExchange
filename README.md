AndysStackExchange
==================
Loads most recent stackoverflow questions tagged with “iphone.”  Allows the user to view details for a question including: who asked, the current score for the question, and the body of the question (markdown not rendered).  Additionally, a profile screen can be viewed which shows the associated user’s reputation.  The profile screen can be accessed from the Question Detail screen for the user who asked the question, and there’s also a link to view my profile from the main screen of the app.

Current Features
==================
Uses a Storyboard rather than a nib
Uses RestKit (loaded from its cocoapod) to load questions tagged with “iphone” from stackoverflow
Navigating into a question will also provide the opportunity to access the person’s profile who asked the question - this accesses another rest resource to load their details
Uses iOS7 CoreText to dynamically size the cell rows and text on the List screen
MasterViewControllerTests contains unit tests for the associate class
Category MasterViewController+Private provides access to “private” MasterViewController methods to enable visibility for unit testing
Use of OCMock to mock classes in unit tests
Use of Delegate pattern to handle callback from ItemsAPI once items are loaded

What would my next features be?
==================
Investigate and integrate CoreData integration with RestKit usage
Add ability for a stackoverflow user to login and take action - for now just vote on questions
Sizing of Detail View Question Body label height isn’t quite right
Improve AutoLayout usage across all screens to better layout views
Resolve warnings
UITableView on main page only looks good on iPhone 5
Detail screen should scroll to show long questions better
All pages should look better in landscape
Add unit tests for other classes
Provide ability for user to have control over which tags they view questions for
Improve support for dynamically sized text on question detail screen and profile screen

