import SwiftUI

struct DetailView: View {
    let place: Place
    @EnvironmentObject var settings: AppSettings
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 1. The Image (Responsive)
                Image(place.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300) // Fixed height for consistency
                    .clipped()
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                
                // 2. The Text Content
                VStack(alignment: .leading, spacing: 16) {
                    // Title & Category
                    VStack(alignment: .leading, spacing: 4) {
                        Text(place.title)
                            .font(.system(size: 28 * settings.fontSizeMultiplier, weight: .bold, design: .rounded))
                            .fixedSize(horizontal: false, vertical: true) // Prevents title truncation
                        
                        Text(place.categoryName.uppercased())
                            .font(.system(size: 12 * settings.fontSizeMultiplier, weight: .bold))
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    Text("About")
                        .font(.system(size: 18 * settings.fontSizeMultiplier, weight: .bold))
                    
                    // The Magic Fix: No manual width calculation
                    Text(place.details)
                        .font(.system(size: 16 * settings.fontSizeMultiplier))
                        .lineSpacing(6)
                        .foregroundColor(.primary.opacity(0.9))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true) // Forces full height
                        .frame(maxWidth: .infinity, alignment: .leading) // Fills available width naturally
                    
                    // Website Button
                    if let linkString = place.externalLink, let url = URL(string: linkString) {
                        Link(destination: url) {
                            Text("Visit Website")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.top, 10)
                    }
                }
            }
            .padding(20) // This single padding handles ALL edges correctly
        }
        .navigationTitle(place.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
