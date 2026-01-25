import SwiftUI

struct DetailView: View {
    let place: Place
    @EnvironmentObject var settings: AppSettings
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dismiss) var dismiss // Allows us to close this view

    var body: some View {
        ScrollView {
            if horizontalSizeClass == .compact {
                VStack(alignment: .leading, spacing: 20) {
                    placeImage(width: nil, height: 400)
                    textContent
                }
                .padding(20)
            } else {
                HStack(alignment: .top, spacing: 40) {
                    placeImage(width: 400, height: 500)
                    textContent
                }
                .padding(40)
            }
        }
        .navigationTitle(horizontalSizeClass == .compact ? "" : place.title)
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        // LISTENER: Waits for Cmd+[ signal from App file
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("GoBack"))) { _ in
            dismiss()
        }
    }

    @ViewBuilder
    private func placeImage(width: CGFloat?, height: CGFloat) -> some View {
        Image(place.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: width ?? .infinity)
            .frame(height: height)
            .clipped()
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.15), radius: 15, x: 0, y: 10)
    }

    private var textContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(place.title)
                    .font(.system(size: 28 * settings.fontSizeMultiplier, weight: .bold, design: .rounded))
                
                Text(place.categoryName.uppercased())
                    .font(.system(size: 12 * settings.fontSizeMultiplier, weight: .bold))
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
            Text("About")
                .font(.system(size: 18 * settings.fontSizeMultiplier, weight: .bold))
            
            Text(place.details)
                .font(.system(size: 16 * settings.fontSizeMultiplier))
                .lineSpacing(6 * settings.fontSizeMultiplier)
                .foregroundColor(.primary.opacity(0.9))
            
            if let linkString = place.externalLink, let url = URL(string: linkString) {
                Link(destination: url) {
                    Text("Visit Website")
                        .font(.system(size: 17 * settings.fontSizeMultiplier, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
                .padding(.top, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
