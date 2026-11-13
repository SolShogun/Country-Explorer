import SwiftUI

struct CountryDetailView: View {
    let country: Country

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                AsyncImage(url: country.flags?.png) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else {
                        Image(systemName: "globe.americas.fill")
                            .resizable().scaledToFit().foregroundStyle(.blue)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .padding()
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 18))

                VStack(alignment: .leading, spacing: 6) {
                    Text(country.name.common).font(.largeTitle.bold())
                    Text(country.name.official ?? country.name.common)
                        .font(.subheadline).foregroundStyle(.secondary)
                }

                VStack(spacing: 0) {
                    detail("Capital", country.capitalText, icon: "building.2")
                    Divider()
                    detail("Region", country.regionText, icon: "globe")
                    Divider()
                    detail("Subregion", country.subregion ?? "Not available", icon: "map")
                    Divider()
                    detail("Population", country.population?.formatted() ?? "Not available", icon: "person.3")
                    Divider()
                    detail("Languages", country.languagesText, icon: "character.bubble")
                    Divider()
                    detail("Currencies", country.currenciesText, icon: "dollarsign.circle")
                    Divider()
                    detail("Area", country.area.map { "\($0.formatted()) km²" } ?? "Not available", icon: "square.dashed")
                }
                .padding(.horizontal, 16)
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 18))
            }
            .padding()
        }
        .navigationTitle("Country Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func detail(_ label: String, _ value: String, icon: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon).foregroundStyle(.blue).frame(width: 24)
            Text(label).foregroundStyle(.secondary).frame(width: 90, alignment: .leading)
            Spacer(minLength: 4)
            Text(value).multilineTextAlignment(.trailing).fontWeight(.medium)
        }
        .font(.subheadline)
        .padding(.vertical, 16)
    }
}
