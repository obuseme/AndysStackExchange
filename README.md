AndysStackExchange
==================
Universal iOS app that loads most recent stackoverflow questions tagged with “iphone.”  Allows the user to view details for a question including: who asked, the current score for the question, and the body of the question (markdown not rendered).  Additionally, a profile screen can be viewed which shows the associated user’s reputation.  The profile screen can be accessed from the Question Detail screen for the user who asked the question, and there’s also a link to view my profile from the main screen of the app.

## Current Features
<ul>
<li>Uses a Storyboard rather than a nib</li>
<li>Uses RestKit (loaded from its cocoapod) to load questions tagged with “iphone” from stackoverflow</li>
<li>Navigating into a question will also provide the opportunity to access the person’s profile who asked the question - this accesses another rest resource to load their details</li>
<li>Uses iOS7 CoreText to dynamically size the cell rows and text on the List screen</li>
<ul><li>Implements the Observer pattern through use of NSNotification API to listen for UIContentSizeCategoryDidChangeNotification</li></ul>
<li>MasterViewControllerTests contains unit tests for the associate class</li>
<li>Category MasterViewController+Private provides access to “private” MasterViewController methods to enable visibility for unit testing</li>
<li>Use of OCMock to mock classes in unit tests</li>
<li>Use of Delegate pattern to handle callback from ItemsAPI once items are loaded</li>
</ul>

## In Progress Features
<ul>
<li>Authentication Flow - The "authorization" branch contains an in-progress work to allow the user to authenticate with the stackexchange system
<ul>
<li>Uses OAuth 2.0 with a custom uri scheme to allow the user to authenticate</li>
<li>Singleton pattern is used to provide one system-wide instance of StackExchangeAuthenticator object</li>
</ul>
</li>
</ul>

## What would my next features be?
<ul>
<li>Investigate and integrate CoreData integration with RestKit usage</li>
<li>Add ability for a stackoverflow user to login and take action - for now just vote on questions</li>
<li>Improve AutoLayout usage across all screens to better layout views</li>
<li>All pages should look better in landscape</li>
<li>Add unit tests for other classes</li>
<li>Provide ability for user to have control over which tags they view questions for</li>
<li>Improve support for dynamically sized text on question detail screen and profile screen</li>
</ul>

## Known Issues
<ul>
<li>UILabel for body text on DetailViewController is not given the correct height</li>
<li>AutoLayout warnings that need to be resolved</li>
<li>Width for UILabel in table cells on main page could be calculated more dynamically in order to better size the row height on orientation change</li>
</ul>
