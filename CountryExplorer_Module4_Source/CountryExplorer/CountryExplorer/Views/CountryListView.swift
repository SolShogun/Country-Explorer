import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading && viewModel.countries.isEmpty {
                    ProgressView("Loading countries…")
                } else if let error = viewModel.errorMessage, viewModel.countries.isEmpty {
                    ContentUnavailableView {
                        Label("Unable to Load", systemImage: "wifi.exclamationmark")
                    } description: {
                        Text(error)
                    } actions: {
                        Button("Try Again") { Task { await viewModel.load() } }
                            .buttonStyle(.borderedProminent)
                    }
                } else if viewModel.filteredCountries.isEmpty {
                    ContentUnavailableView.search(text: viewModel.searchText)
                } else {
                    List(viewModel.filteredCountries) { country in
                        NavigationLink(destination: CountryDetailView(country: country)) {
                            CountryRow(country: country)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable { await viewModel.load() }
                }
            }
            .navigationTitle("Country Explorer")
            .searchable(text: $viewModel.searchText, prompt: "Country, capital, or region")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { Task { await viewModel.load() } } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .disabled(viewModel.isLoading)
                    .accessibilityLabel("Refresh countries")
                }
            }
            .task { if viewModel.countries.isEmpty { await viewModel.load() } }
        }
        .tint(.blue)
    }
}
