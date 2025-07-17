//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Abcom on 17/07/25.
//

import SwiftUI
//Edit button that toggles the environment’s editMode value on and off.

//The EditButton controls the same editMode environment value that you accessed in the previous step.

struct ProfileHost: View {
    @State var draftProfile = Profile.default
    @Environment(ModelData.self) var modelData
    @Environment(\.editMode) var editMode
    var body: some View {
       VStack{
           HStack{
               if editMode?.wrappedValue == .active {
                                  Button("Cancel", role: .cancel) {
                                      draftProfile = modelData.profile
                                      editMode?.animation().wrappedValue = .inactive
                                  }
                              }
               Spacer()
               EditButton()
           }
           if editMode?.wrappedValue == .inactive {
               ProfileSummary(profile: modelData.profile)
                    .padding()
           }
           else{
               ProfileEditor(profile: $draftProfile)
                   .onAppear{
                       draftProfile = modelData.profile
                   }
                   .onDisappear{
                       modelData.profile = draftProfile
                   }
           }
       }.padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
