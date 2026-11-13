import Foundation

struct CountryService {
    func fetchCountries() async throws -> [Country] {
        guard let url = URL(string: "https://restcountries.com/v3.1/all?fields=name,flags,capital,region,subregion,population,languages,currencies,area,cca3") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 20
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Country].self, from: data)
            .sorted { $0.name.common.localizedStandardCompare($1.name.common) == .orderedAscending }
    }
}
