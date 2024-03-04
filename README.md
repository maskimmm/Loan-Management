# Loan Management App

## Content
1. [Summary](#summary)
2. [Coding Guideline](#coding-guideline)
  - [Variable & Constant Naming](#variable--constant-naming)
  - [Function Naming](#function-naming)
  - [Struct & Class Naming](#struct--class-naming)
  - [Indentation Convention](#indentation-convention)
3. [GitFlow Workflow](#gitflow-workflow)
  - [Commit Message Convention](#commit-message-convention)
4. [Design Pattern & File Structure](#design-pattern--file-structure)
  - [Design Pattern](#design-pattern)
  - [File Structure](#file-structure)
<br><br>

### Summary
This project created to complete iOS Developer test for Samir. It Consist of Loan List Screen, Loan Detail Screen, Loan Document View. It also has additional feature to sort the Loan Datas based on Name, Amount, Term, and Purpose.

#### How To Run This Project
- Using Xcode + Simulator/Device
  1. Clone the repository
  2. Open Loan Management.xcodeproj using Xcode
  3. Select device/simulator to build (I use iPhone 15 Simulator, iOS 17.0.1), and Run.
- Using iOS Device
  1. Download Testflight on Appstore
  2. Follow instruction provided on this link 
<br><br>

### Coding Guideline
#### Variable & Constant Naming
- Use U.S. English Spelling
- Promote Clear Usage
- Lower Camel Case
- Use positive type

:white_check_mark: DO:
```swift
var activityName: String // Lower Camel Case
var countVocabulary: Int // Promote Clear Usage
var isActive: Bool // Use Positive Type
```

:x: DONT:
```swift
var namaBenda: String // Not using U.S. English spelling
var item: Int // Not promote clear usage
var count_vocabulary: Int // Use camelCase instead of snake_case
var isNotActive: Bool // Not using positive type
```

#### Function Naming
- Avoid Abbreviation
- Clarity before brevity
- Use descriptive name

:white_check_mark: DO:
```swift
func addItem(...){} // Use descriptive name
func calculateBodyMassIndex(...){} // Avoid Abbrevation
```

:x: DONT:
```swift
func add(...){} // Function name unclear
func calc(...){} // Avoid abbreviation
```

#### Struct & Class Naming
- Upper Camel Case
- Struct name = file name
- Class name = file name

:white_check_mark: DO:\
Say the filename is Item.swift and contain Item's struct/class, then:
```swift
struct Item{} // Implement struct name == file name
class Item{} // Implement class name == file name
```

#### Indentation Convention
- Command + a -> Select all code in a file 
- Control + i -> Format code
<br><br>

### GitFlow Workflow
#### Commit Message Convention
- Write clear commit message using format: `<Type> : <Subject/Details>`
- Example:
  > FIX: Fix keyboard not showing

Type:
```txt
Feat: to add a new feature
Fix: to fix existing bug
docs: documentation changes only
refactor: A code change that neither fix a bug nor adds a feature
perf: A code changes that improve performances
test: Adding missing tests
chore: changes to the build process or auxiliary tools and libraries such as documentation generation
```
<br><br>

### Design Pattern & File Structure
#### Design Pattern
This project implement MVVM as its main design pattern.
> For Getting Started with MVVM you could check this sample project using SwiftUI MVVM: https://paulallies.medium.com/swiftui-mvvm-a1e7a18f4f03

#### File Structure
```txt
Loan Management/
|-- Models/
|-- Views/
|-- ViewModels/
|-- Helpers/
|-- Repositories/
```
- **Models**: Contains structs or classes that represent data model
- **Views**: Contains UI presentations to display data to user
- **ViewModels**: Contains classes responsible for interacting with the models, processing data, and preparing it for the View layer
- **Helpers**: Contains various helper classes and utilities that may be used throughout the app, such as constants, enums, network services, etc.
- **Repositories**: Contains storage implementation from either local repository or remote repository.
<br>
