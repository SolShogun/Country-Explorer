import SwiftUI

struct CountryRow: View {
    let country: Country

    var body: some View {
        HStack(spacing: 14) {
            AsyncImage(url: country.flags?.png) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFit()
                } else {
                    Image(systemName: "globe.americas.fill")
                        .resizable().scaledToFit().foregroundStyle(.blue.opacity(0.5))
                }
            }
            .frame(width: 64, height: 44)
            .clipShape(RoundedRectangle(cornerRadius: 6))

            VStack(alignment: .leading, spacing: 5) {
                Text(country.name.common).font(.headline)
                Text("\(country.regionText) • \(country.capitalText)")
                    .font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
            }
            Spacer(minLength: 4)
            Image(systemName: "chevron.right").font(.caption).foregroundStyle(.tertiary)
        }
        .padding(.vertical, 8)
        .accessibilityElement(children: .combine)
    }
}
