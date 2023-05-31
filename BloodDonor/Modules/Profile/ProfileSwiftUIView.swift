import SwiftUI

struct Achievement: Hashable {
    var name: String
    var icon: String
}

struct UserProfile: Hashable {
    var username: String
    var profileImage: String
    var achievements: [Achievement]
    var exp: Int
}

struct ProfileSwiftUIView: View {
    
    var userProfile: UserProfile
    
    var body: some View {
        VStack {
            HStack {
                Image(userProfile.profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                    )
                .shadow(radius: 7)
                VStack {
                    Text(userProfile.username)
                        .font(.title)
                        .fontWeight(.bold)
    
                    Text("Current Level: 20")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                } .padding(20)
            }
            
            // Experience points progress bar
                        VStack {
                            HStack {
                                Text("Experience:")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .lineLimit(nil)
                                Text("\(userProfile.exp)/1000")
                                    .font(.subheadline)
                                    .lineLimit(0)
                            }.padding()
                            .multilineTextAlignment(.leading)
                            
                            ZStack {
                                ProgressBar(value: Double(userProfile.exp), maxValue: 1000, barHeight: 8, barColor: .red)
                            }.padding()
                        }
            
            HStack {
                ForEach(userProfile.achievements, id: \.self) { achievement in
                    VStack {
                        Image(systemName: achievement.icon)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 4)
                        Text(achievement.name)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 80, height: 80)
                }
            }
            
            HStack {
                ForEach(userProfile.achievements, id: \.self) { achievement in
                    VStack {
                        Image(systemName: achievement.icon)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 4)
                        Text(achievement.name)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 80, height: 80)
                }
            }
            
            
            HStack {
                ForEach(userProfile.achievements, id: \.self) { achievement in
                    VStack {
                        Image(systemName: achievement.icon)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 4)
                        Text(achievement.name)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 80, height: 80)
                }
            }
            
            HStack {
                ForEach(userProfile.achievements, id: \.self) { achievement in
                    VStack {
                        Image(systemName: achievement.icon)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 4)
                        Text(achievement.name)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 80, height: 80)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ProgressBar: View {
    
    var value: Double
    var maxValue: Double
    var barHeight: CGFloat
    var barColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: barHeight)
                    .opacity(0.3)
                    .foregroundColor(barColor)
                
                Rectangle()
                    .frame(width: min(CGFloat(value / maxValue) * geometry.size.width, geometry.size.width), height: barHeight)
                    .foregroundColor(barColor)
            }
        }
    }
}

struct ProfileSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let achievements: [Achievement] = [
            Achievement(name: "Completed Tutorial", icon: "star.fill"),
            Achievement(name: "Reached Level 10", icon: "star.fill"),
            Achievement(name: "Completed all Quests", icon: "star.fill"),
            Achievement(name: "Reached 1000 Points", icon: "star.fill")
        ]
        let userProfile = UserProfile(username: "John Doe", profileImage: "person.circle.fill", achievements: achievements, exp: 750)
        ProfileSwiftUIView(userProfile: userProfile)
    }
}

