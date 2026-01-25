import Foundation

struct Place: Codable, Identifiable, Hashable {
    var id: String { title }
    var title: String
    var sneakPeek: String
    var details: String
    var externalLink: String?
    var imageName: String
    var categoryName: String
}

struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

let sampleCategories: [Category] = [
    Category(name: "All Guides"),
    Category(name: "Temples"),
    Category(name: "Food & Dining"),
    Category(name: "Churches"),
    Category(name: "Mosques"),
    Category(name: "Malls"),
    Category(name: "Beaches"),
    Category(name: "Parks"),
    Category(name: "Nature Views"),
    Category(name: "Landmarks")
]

func loadPlaces(from fileName: String) -> [Place] {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        print("Error: Could not find \(fileName).json in the bundle.")
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Place].self, from: data)
    } catch {
        print("Error decoding JSON from \(fileName): \(error)")
        return []
    }
}
