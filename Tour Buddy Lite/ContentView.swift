import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: Category? = sampleCategories[0]
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool // Controls the cursor
    
    let allPlaces = loadPlaces(from: "leisure_places") +
                    loadPlaces(from: "religious_places") +
                    loadPlaces(from: "nature_and_viewpoints")

    var body: some View {
        NavigationSplitView { // Navigation engine 
            List(sampleCategories, selection: $selectedCategory) { category in
                NavigationLink(value: category) {
                    Label(category.name, systemImage: iconForCategory(category.name))
                }
            }
            .navigationTitle("Guides")
            #if os(macOS)
            .navigationSplitViewColumnWidth(min: 200, ideal: 250)
            #endif
            .searchable(text: $searchText, placement: .sidebar, prompt: "Search Places")
            .focused($isSearchFocused) // Binds the search bar to our focus state
            
        } detail: {
            NavigationStack {
                if let category = selectedCategory {
                    AlbumGridView(category: category, places: allPlaces, searchText: searchText)
                        .navigationDestination(for: Place.self) { place in
                            DetailView(place: place)
                        }
                } else {
                    ContentUnavailableView("Select a Guide", systemImage: "map")
                }
            }
        }
        // LISTENER: Waits for Cmd+F signal from App file
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("FocusSearch"))) { _ in
            isSearchFocused = true
        }
    }
    
    func iconForCategory(_ name: String) -> String { //For side bar
        switch name {
        case "Temples": return "building.columns"
        case "Churches": return "cross"
        case "Mosques": return "moon.stars"
        case "Food & Dining": return "fork.knife"
        case "Malls": return "bag"
        case "Beaches": return "water.waves"
        case "Parks": return "tree"
        case "Nature Views": return "camera"
        case "Landmarks": return "star"
        default: return "map"
        }
    }
}

struct AlbumGridView: View { // The aple music style appearence
    let category: Category
    let places: [Place]
    let searchText: String
    @EnvironmentObject var settings: AppSettings // For font scaling
    
    var filteredPlaces: [Place] {
        let categoryList = (category.name == "All Guides") ? places : places.filter { $0.categoryName == category.name }
        if searchText.isEmpty { return categoryList }
        return categoryList.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.sneakPeek.localizedCaseInsensitiveContains(searchText)
        }
    }

    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200), spacing: 20)]

    var body: some View {
        ScrollView {
            if filteredPlaces.isEmpty {
                ContentUnavailableView.search(text: searchText)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredPlaces) { place in
                        NavigationLink(value: place) {
                            VStack(alignment: .leading) {
                                Image(place.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 160, height: 200)
                                    .clipped()
                                    .cornerRadius(12)
                                    .shadow(radius: 2)
                                
                                Text(place.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .lineLimit(1)
                                
                                Text(place.sneakPeek)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category.name)
    }
}
