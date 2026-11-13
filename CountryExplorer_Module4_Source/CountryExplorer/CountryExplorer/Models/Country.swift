import Foundation

struct Country: Codable, Identifiable {
    struct Name: Codable { let common: String; let official: String? }
    struct Flags: Codable { let png: URL?; let svg: URL?; let alt: String? }
    struct Currency: Codable { let name: String?; let symbol: String? }

    let name: Name
    let flags: Flags?
    let capital: [String]?
    let region: String?
    let subregion: String?
    let population: Int?
    let languages: [String: String]?
    let currencies: [String: Currency]?
    let area: Double?
    let cca3: String

    var id: String { cca3 }
    var capitalText: String { capital?.joined(separator: ", ") ?? "Not available" }
    var regionText: String { region ?? "Not available" }
    var languagesText: String { languages?.values.sorted().joined(separator: ", ") ?? "Not available" }
    var currenciesText: String {
        guard let currencies, !currencies.isEmpty else { return "Not available" }
        return currencies.values.compactMap { $0.name }.sorted().joined(separator: ", ")
    }
}
