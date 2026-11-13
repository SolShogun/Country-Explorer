import Foundation

@MainActor
final class CountryViewModel: ObservableObject {
    @Published private(set) var countries: [Country] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    @Published var searchText = ""
    private let service = CountryService()

    var filteredCountries: [Country] {
        guard !searchText.isEmpty else { return countries }
        return countries.filter {
            $0.name.common.localizedCaseInsensitiveContains(searchText) ||
            $0.regionText.localizedCaseInsensitiveContains(searchText) ||
            $0.capitalText.localizedCaseInsensitiveContains(searchText)
        }
    }

    func load() async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        do { countries = try await service.fetchCountries() }
        catch {
            if countries.isEmpty { errorMessage = "Could not load countries. Check your internet connection and try again." }
        }
    }
}
