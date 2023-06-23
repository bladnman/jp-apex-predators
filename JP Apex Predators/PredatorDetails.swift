//
//  PredatorDetails.swift
//  JP Apex Predators
//
//  Created by Matt Maher on 6/22/23.
//

import SwiftUI

struct PredatorDetails: View {
    let predator: ApexPredator

    var body: some View {
        ScrollView {
//            VStack(alignment: .trailing) {
//                Image(predator.type)
//                    .resizable().scaledToFit()
//                Image(predator.imageName())
//                    .resizable().scaledToFit()
//                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
//                    .shadow(color: .black, radius: 6, x: 0, y: 0)
//                    .offset(y: -210)
//                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
//            }
            ZStack(alignment: .trailing) {
                Image(predator.type)
                    .resizable().scaledToFit()
                Image(predator.imageName())
                    .resizable().scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
                    .shadow(color: .black, radius: 6, x: 0, y: 0)
                    .offset(y: 40)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            .padding(.bottom, -20)
            VStackLayout(alignment: .leading) {
                Text(predator.name).font(.largeTitle)

                Spacer()

                Text("Appears In:").font(.title3)
                ForEach(predator.movies, id: \.self) { movie in
                    Text("• " + movie).font(.subheadline)
                }
                Spacer(minLength: 20)

                Text("Movie Moments:").font(.title)
                ForEach(predator.movieScenes) { scene in
                    Text(scene.movie).font(.title2)
                        .padding([.top, .bottom], 1)
                    Text(scene.sceneDescription)
                        .padding(.bottom, 15)
                }
                Spacer(minLength: 20)

                Text("Read More:").font(.caption)
                Link(predator.link, destination: URL(string: predator.link)!)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PredatorDetails_Previews: PreviewProvider {
    static var previews: some View {
        PredatorDetails(predator: samplePredator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
