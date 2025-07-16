//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Abcom on 16/07/25.
//


import SwiftUI

//Why do I need to use @Bindable when I already have @Environment(ModelData.self) var modelData? Can't I just use the modelData from @Environment directly?


//@Environment(ModelData.self) gives you:
//A reference to a shared observable model
//
//✅ You can read from it
//
//❌ You cannot bind or write to its properties directly
//
//That’s where @Bindable comes in:
//
//@Bindable var modelData = modelData:
//Wraps your modelData in a binding-friendly way
//
//Allows you to mutate properties like:
//
//modelData.landmarks[index].isFavorite = true
//
//Or bind to $modelData.landmarks[index].isFavorite
//
//🛠️ Why not just use @ObservedObject?
//You can't use @ObservedObject or @StateObject here because:
//
//ModelData is provided via @Environment
//
//You don't own it — SwiftUI injects it
//
//Only @Environment(...) + @Bindable lets you:
//
//Access the environment model
//
//Bind to and mutate its properties


struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData: ModelData
    var landmarkIndex:Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var landmark:Landmark
    var body: some View {
         @Bindable var modelData = modelData
        
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack(alignment:.leading) {
                
                
                HStack{
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.center)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                       
                    Spacer()
                    Text(landmark.state)
                         
                } .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Divider()
                Text("about \(landmark.name)")
                                  .font(.title2)
                Text(landmark.description)
                
                
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(ModelData())
}
