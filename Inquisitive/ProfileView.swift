//
//  ProfileView.swift
//  Inquisitive
//
//  Created by Vincent Saranang on 20/06/24.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @State private var selectedPage: Int = 0
    @StateObject private var profileConfig = ProfileConfiguration()

    let pages: [ProfileSegment] = [.profile, .badge, .setting]

    enum ProfileSegment: CaseIterable, Identifiable {
        case profile
        case badge
        case setting

        var id: String { title }

        var image: Image {
            switch self {
            case .profile: return Image(systemName: "person.circle.fill")
            case .badge: return Image(systemName: "star.circle.fill")
            case .setting: return Image(systemName: "gear.circle.fill")
            }
        }

        func view(profileConfig: ProfileConfiguration) -> AnyView {
            switch self {
            case .profile: return AnyView(ProfileDetailView(profileConfig: profileConfig))
            case .badge: return AnyView(BadgeView())
            case .setting: return AnyView(SettingsView())
            }
        }

        var title: String {
            switch self {
            case .profile: return "Profile"
            case .badge: return "Badge"
            case .setting: return "Setting"
            }
        }
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .frame(width: UIScreen.main.bounds.width-300, height: UIScreen.main.bounds.height-256)
            .foregroundColor(Color(hex:"005A71"))
            .overlay {
                HStack {
                    VStack {
                        ForEach(pages.indices, id: \.self) { index in
                            BookmarkTab(isSelected: selectedPage == index, image: pages[index].image)
                                .onTapGesture {
                                    withAnimation {
                                        selectedPage = index
                                    }
                                }
                        }
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 80)

                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color(hex:"F7F7F7"))
                        .padding([.vertical, .trailing], 16)
                        .overlay {
                            VStack {
                                pages[selectedPage].view(profileConfig: profileConfig)
                                    .padding(36)
                            }
                        }
                }
            }
    }
}

// Custom BookmarkTab View
struct BookmarkTab: View {
    var isSelected: Bool
    var image: Image

    var body: some View {
        HStack {
            Rectangle()
                .clipShape(.rect(topLeadingRadius: 24, bottomLeadingRadius: 24))
                .foregroundColor(isSelected ? Color(hex:"F7F7F7") : Color(hex:"E2E2E2"))
                .frame(width: 84, height: 88)
                .overlay {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .foregroundColor(isSelected ? Color(hex: "005A71") : Color(hex: "444D69"))
                }
                .padding(.horizontal, -4)
                .padding(.bottom, -8)
            Rectangle()
                .fill(isSelected ? Color(hex:"F7F7F7") : Color(hex:"E2E2E2"))
                .frame(width: 4, height: 88)
                .padding(.horizontal, -4)
                .padding(.bottom, -8)
        }
        .padding(.trailing, -8)
    }
}

// BadgeView
struct BadgeView: View {
    var body: some View {
        VStack {
            Text("Badges")
                .font(.largeTitle)
                .foregroundColor(Color(hex:"374362"))
            Spacer()
            // Add badge view content
        }
    }
}

// SettingsView
struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .foregroundColor(Color(hex:"374362"))
            Spacer()
            // Add settings view content
        }
    }
}

#Preview {
    ProfileView()
}
