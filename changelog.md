## [1.0.0] - Draft

**Platforms build support/releases roadmap**
- Android - Feature Complete
  - Release:
    - apk/appBundle - Next Update
    - Play Store - Next Update
    - FDroid - Medium Priority
- iOS || iPadOS - Feature Complete
  - Release: 
    - App Store - High Priority 
    - (Where else? lol)
    - (Ok fine, TestFlight - High Priority)
    - (And IPA releases if Mr Tim Apple allows us non-EU peasants access to iOS sideloading, for me to be able to test it)
    - (PS, If you are an EU dev and would like to help with the above point, I am open to relocation job offers/referrals :>)
  - Broken:
    - Sharing sheet (iPadOS)
- macOS - Builds with some features broken
  - Release: 
    - DMG - High Priority
    - App Store - Low Priority
- Windows - Might build with some debugging, haven't tested
  - Release:
    - Windows Installer - N/A
    - Hotel - Trivago
    - Microsoft Store - N/A
- Linux - Might build with some debugging, haven't tested
  - Release:
  ~~- Steam Deck - Maximum Priority~~
    - Snap - N/A
    - Bundle - N/A
- Web -
  - Release:
    - www.github.com (Idk what else you expected)
    - Why would you even want this project as a web app? (I mean, I am not stopping you from compiling it, but why?)
    - Flutter web is a prank
    - Never happening

_Please don't open new issues for this build, instead post the issues as comments on the PR for it._
**UNDER DEV STUFF FOR NEXT RELEASE(A LOT OF STUFF WILL BE BROKEN)**
- Repo Screens
- Issue/Pull Screens
- Home Screen
- User Profile Screen
*Currently disabled*
- Editing Themes (Need to implement a new setup to handle 2 possible theme brightnesses)
*Planned Additions (Not in any particular order)*
- View followers, starred repos of users (with filtering options), watchers, people who starred a repo etc
- New settings screen
- Chucker integration

**Upcoming DLCs (free I promise)**
- Edit comments
- More issue editing options
- More pull editing options
- Share github link into app to open as deeplink (for iOS and Android>=13)
- Releases
- Gists
- Multi account support

**Font/UI scaling**

**Dynamic Tabs**
- Browser like openable/closeable tabs to prevent clutter on Repo, Issue, Pull screens.

**Context Menus**
- URL menus- open in browser, copy link, share link, open in app if deeplink

**Failed UI components due to loss of Internet now refresh themselves when back online**

**UI Redesign**

**Retry buttons**

**Dark/Light Themes, Material You support**

**Build Flavors for Android**

**Code Blocks**

**Readme Updates**
- Copy on code block
- Anchor links now work


**Info Cards**

**Scroll to top**

**Issue/Pull Screen Redesign**
- Redesigned issue/pull screen.
- Comment reactions are here!
- Dynamic tabs added to these screens.
- Issues and pulls are editable now.

**Comment Reactions**

**Editing System**
- Editing system that integrates with the UI redesigns mentioned in this changelog.

**Enhancements**
- Anchor links now work in markdown.
- Improved transition animations.
- Added scroll to top prompt on readme tab of a repository.
- Link actions sheet now shows options based on context.

**Bug Fixes**
- Fixed case where multiple API calls might happen on widget rebuilds.
- Fixed an issue with graphQL requests not caching.
- `.markdown` files now render in markdown mode in the file viewer.
- "-" filter fix in search.
- Rewrote API Handler.
- Rewrote Bottom Sheet utilities.


Dev Changelog:
- Migrated Readme Parser - 
- Added lint rules to project
- Submodule setup to manage forked or personal dependencies.
- Migrated GraphQL codegen - Apollo to Ferry

---
## [0.3.2] - 07 August 2021
**Bug Fixes**
- App getting stuck on splash screen on reinstall.
- Search type getting reset on typing in search screens.
- Fix a null value check on pull request screens.
---
## [0.3.1] - 06 August 2021
**Enhancements**
- View pinned issues on a repository.
- Watch buttons on repository screens now works.
- Follow button added to user profile screens.
- Follow users from user cards themselves (For example, in search).

**Bug Fixes**
- Search type dropdown vanished on search screen.
---
## [0.3.0] - 10 July 2021
**Authentication**
- Authentication to access the app made compulsory.
- Added the option to authenticate via a browser or a one-time code.
- Removed a lot of the permissions the app requested for that it does not need currently.
- If app was opened via a deeplink and user is unauthenticated, the deep link will be honored as
  soon as the authentication is completed.

**Settings**
- Customise the app's color palette according to your preferences. 
- Share themes as a link that opens in the app and gives a prompt to load said theme.
- Added multiple font options to select from.
 
**Issue/Pull Request Screen enhancements** 
- Ability to quote (full/select) replies.
- Added all missing timeline item cases.
- Added ability to view Pull Request Reviews and reply to them.

**Create Issues**
- Ability to create issues on repositories.
- Supports issue templates.
- Markdown editor for description.
- Supports previewing the text markdown.

**Enhancements**
- Added organizations tab to the home screen.
- Text in code blocks is now selectable.
- Added share URL button on many screens.
- Star button on repository screens now works.
- Star repositories from the repository cards themselves (For example, from the activity tab)
- Follow users from user cards themselves (For example, in search)
- Splash screen logo improvements.
- Complete Github Flavored Markdown support.

**Deep-links**
- Settings URL exception added in deep-links. 
- **(FIXED)** Pull request deeplink fixed.

**Misc**
- App caching default max-age dropped from 10 minutes to 3 minutes.
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
