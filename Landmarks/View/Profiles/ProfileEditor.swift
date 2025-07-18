//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Abcom on 17/07/25.
//

import SwiftUI

struct ProfileEditor: View {
   @Binding var profile:Profile
    var dateRange: ClosedRange<Date> {
         let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
         let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
         return min...max
     }
    
    
    var body: some View {
        List{
            HStack{
                Text("USername")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
                
                
            }
            
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications")
            }
            
            Picker("Preferred", selection: $profile.seasonalPhoto){
                ForEach(Profile.Season.allCases, id:\.self){
                    season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                           Text("Goal Date")
                       }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
