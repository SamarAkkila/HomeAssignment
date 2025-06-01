# HomeAssignment


# Recipe App 
A SwiftUI-based iOS application built as part of a take-home assignment for Fetch.

# Summary
A SwiftUI-based recipe app that displays recipes fetched from a remote API. Users can scroll through a list of recipes, tap to view more details, and pull down to refresh the data at any time. The app uses async/await for clean asynchronous networking, includes error handling, and implements manual disk caching for images — all without third-party libraries.

# Features
•	Recipes are fetched using URLSession and parsed from a remote JSON API.
•	Pull-to-refresh support allows reloading data on demand using .refreshable.
•	Selecting a recipe navigates to a detail screen with the image, cuisine type, and a mock list of ingredients.
•	Images are manually cached to disk using FileManager to reduce repeated network requests.
•	Screenshots attached in the Assets folder:
1.	Screenshot-RecipeList
2.	Screenshot-RecipeDetail



# Focus Areas
I focused on the following key areas to reflect production-level architecture and decisions:
•	Swift Concurrency: Used async/await for clean, structured async code.
•	Image Caching: Implemented manual disk-based caching to reduce bandwidth and improve performance.
•	Error Handling: Differentiated clearly between malformed, empty, and no-internet scenarios.
•	Pull-to-Refresh: Enabled seamless reload via .refreshable modifier on scroll.
•	MVVM Architecture: Followed the MVVM pattern to separate data, business logic, and UI cleanly.
•	Test Coverage: Included unit tests for API responses and image caching to validate critical logic.

# Time Spent
Total: ~ 3-4 hours
•	Core app architecture (models, networking) -> 30 mins
•	SwiftUI UI building (list/detail) -> 1 hr
•	Disk image caching -> 30 mins
•	Error handling (malformed, empty) -> 15 mins
•	Unit testing & debugging -> 30 mins
•	Polish, styling, README, screenshots -> 1 hr


# Trade-offs and Decisions
•	Minimal detail content: The detail view displays only what the API provides (name, image, cuisine) due to limited fields.
•	Basic styling: Focused on clean and functional UI over rich design or animation to emphasize architectural soundness.
•	No offline data caching: Recipes are not persisted locally; only images are cached. Data is re-fetched at each app launch, as offline access was not a requirement.

# Weakest Part of the Project
•	The detail screen is limited to displaying basic recipe information due to the constraints of the provided API.
•	The app does not cache recipe data locally, so a network connection is required to view the list after each launch.
•	Error handling is functional but minimal; in a production app, I would enhance it with user-friendly alerts and localized messages.


# Additional Information
•	Built for iOS 16+ using Swift 5.9 and SwiftUI.
•	Architecture pattern used: Model-View-ViewModel (MVVM).
•	100% native — no third-party dependencies or packages.
•	Modular, testable structure following Apple’s best practices.
•	Includes unit tests for:
o	API success and failure cases
o	Image caching logic

