//
//  MissionView.swift
//  MoonShot
//
//  Created by Mohammed Mubashir on 04/04/23.
//

import SwiftUI

struct MissionView: View {
    
    
    struct CrewMember {
        let role:String
        let astronaut:Astronaut
    }
    
    let mission : Mission
    let crew : [CrewMember]
    
    var body: some View {
        GeometryReader{
            geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(crew,id: \.role) { crewMember in
                                NavigationLink {
                                    Text("Astranout Detaile's")
                                }label: {
                                    HStack{
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104,height: 72)
                                            .clipShape(Capsule())
                                            .overlay{
                                                Capsule()
                                                    .strokeBorder(.white,lineWidth: 1)
                                            }
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map{member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    
    
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
