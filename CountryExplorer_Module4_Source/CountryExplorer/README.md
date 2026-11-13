# Country Explorer — Module 4 API Assignment

A native SwiftUI iOS application that loads real country information from the [REST Countries API](https://restcountries.com/), decodes JSON using `Codable`, displays a searchable list, and navigates to country details.

## Features
- Live network request with `URLSession` and async/await
- `Codable` models for country, flag, and currency data
- Search by country, capital, or region
- Country flags using `AsyncImage`
- Country details: capital, region, subregion, population, languages, currencies, and area
- Loading, error, retry, refresh, and empty-result UI

## Setup in Xcode
1. Open Xcode on a Mac and select **File > New > Project > iOS > App**.
2. Name the project **CountryExplorer**. Select **SwiftUI** for Interface and **Swift** for Language. Set deployment target to **iOS 17.0 or newer**.
3. Delete the generated `ContentView.swift` and replace the generated app entry file with `CountryExplorerApp.swift` from this package.
4. In Xcode, add the `Models`, `Services`, `ViewModels`, `Views`, and `Components` folders and their Swift files to the app target using **File > Add Files to "CountryExplorer"**. Ensure target membership is checked.
5. Choose an iPhone simulator, then press **Command + R**.
6. The app requires an internet connection to load countries. No API key or extra package is needed.

## API
`GET https://restcountries.com/v3.1/all?fields=name,flags,capital,region,subregion,population,languages,currencies,area,cca3`

## Testing checklist
- Launch with internet: list loads
- Tap a country: details appear
- Search for a country, capital, or region
- Search for nonsense: empty state appears
- Turn off internet and relaunch: error/retry appears
- Turn internet back on and tap Try Again
- Pull down to refresh the list

## GitHub submission
1. In GitHub, create a new public repository named `CountryExplorer-Module4`.
2. In Xcode, choose **Integrate > New Git Repository** if Git is not enabled (menu varies by version).
3. Commit your complete Xcode project, including `.xcodeproj` and the Swift source files.
4. Push the repository to GitHub using Xcode's Source Control interface or Git commands.
5. Open the GitHub repository and verify the source files and README are visible.
6. Submit the repository URL to your course.

## Notes
This download contains all source files and instructions, not a generated `.xcodeproj` or compiled iOS app. Build and test in Xcode before submission.
