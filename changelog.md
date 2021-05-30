## [0.3.0] - In Development
**Authentication**
- Authentication to access the app made compulsory.
- If app was opened via a deeplink and user is unauthenticated, the deep link will be honored as
  soon as the authentication is completed.
 
**Issue/Pull Request Screen enhancements** 

**Create Issues**
- Ability to create issues on repositories.
- Supports issue templates.
- Markdown editor for description.
- Supports previewing the text markdown.

**Enhancements**
- Splash screen logo improvements.
- Complete Github Flavored Markdown support.

**Bug Fixes**
- Settings URL exception added in deep-links. 
- Pull request deeplink fixed.
---
## [0.2.1] - 29 April 2021
**Bug Fixes**
- Issues/Pulls screen would not open if unauthenticated.
- Links opened through another app gave a grey screen.

## [0.2.0] - 29 April 2021
*If you had a previous release installed, this version will install as a new app. You can uninstall the previous one.*

- New logo
- New splash screen
- New loading indicator
- New app name

**Deep-linking**
- External links now open in the app.
- Internal links will now lead directly to the relevant page instead of showing a popup for the URL.
- Cases not handled will open in an in app browser.
- Report any URL patterns that should be opening in the app or any patterns not opening as they should here: https://github.com/NamanShergill/diohub/issues/17
- *Upcoming: Deeplink to directory/file paths in repository code view in the next release.*

**Enhancements**
- Code browsing rewritten to be more similar to the website.
- Content load on code browsing is now ~40% faster.
- Quick filters and sort options initially collapsed on some pages with the search bar.

**Fixes**
- Search bar animates twice in some cases.
- Some other misc fixes.
---
## [0.1.2] - 22 April 2021.

**Search improvements**
- Quick Filters
- Bug fixes

**Markdown improvements**
- Tables fixed
- Check if a #<number> issue exists or not before linking to it, same with user mentions.
- Code blocks improvements.

## [0.1.1] - 16 April 2021.

- Bug/Fixes and scroll enhancements.
- Scroll to top prompt added.
- Search UI improvements.

## [0.1.0] - 15 April 2021.

**Search/Filters**
- Context based filter suggestions
- Context based query helpers.
- Visual indication of if a filter has been formatted properly, or not, or is not allowed.
---
## [0.0.4] - 04 April 2021.

**Fixes**
- Failure to open URLs on Android 11.
- Notifications never refresh unless manually done so.
- Wrong issue/pulls linked to in cross reference events in issue/pull discussion.
- Markdown emojis not being parsed.
- Comment box does not close after new comment is added in some cases.

**Enhancements**
- Bottom sheet with lists (for example. commit history browsing), opens halfway on initial tap instead of full screen now.
- Splash effect fixes on some tab bars.

## [0.0.3] - 25 March 2021.

- Better authentication error handling.
- API wrapper logging enabled by default for easier debugging.

## [0.0.2] - 24 March 2021.

- Initial Release.
