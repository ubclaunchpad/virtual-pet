# Virtual Pet Mobile App

## Running the current flutter project (assuming VSCODE)
Getting + setting up project in local repo:
1. clone the repo into your local workspace
2. in your terminal, navigate to virtual-pet/front-end/virtual_pet
3. run flutter pub get to install all project libraries

## Running the app (assuming macos & vscode):
> :warning:
* make sure you have the VSCode flutter extension installed
* flutter itself is setup in your computer

#### Steps:
1. go to main.dart
2. there should be a Run button above void main()
    * If you have a mac, click enable macos when a popup appears after clicking Run
    * If you have windows, click enable android
    * If you select the wrong option, delete the  generated windows/web/macos/ios/android folder and try again from step 1
3. go back to main.dart and click the Run button above void main()

## General workflow notes
* be sure to run `git pull` while on `main` to get the latest code
* then run `git checkout -b <your-branch-name-here>` to switch to a new branch
* make your changes on this new branch
* once you are done making your changes, be sure to run `flutter analyze` to lint your code and fix any linting errors
* commit any changes made from fixing any linting errors
* switch back to `main` to get any new changes that occurred while you were working on your changes
* switch back to `<your-branch-name-here>` and run `git rebase main`
* push your branch to GitHub
* open a pull request and assign two people to review your work
