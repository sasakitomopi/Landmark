import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData
    
    var filteredLandmarks:[Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
        List{
            Toggle(isOn:$showFavoritesOnly) {
                Text("Favorite Only")
            }
            
            
            ForEach(filteredLandmarks){ landmark in
                NavigationLink(destination:LandmarkDetail(landmark:landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
            
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
