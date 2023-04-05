//
//  NewsArticle.swift
//  Spacexx
//
//  Created by Mohammed Mubashir on 29/03/23.
//

import CachedAsyncImage
import SwiftUI

struct NewsArticle: View {
    let title : String
    let summary : String
    let imageUrl : String
    let siteName: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string:imageUrl),transaction:Transaction(animation: .easeInOut)){
                    phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    }
                    else {
                        HStack{
                            ProgressView()
                        }
                    }
                }
            }
                Text(title)
                    .font(.headline)
                    .padding(8)
            Text(summary)
                    .font(.body)
                    .padding(8)
            
        }
        
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Mohammed Mubashir", summary: "This is a Youtube Channel", imageUrl: "...", siteName: "mohammedmubashir")
    }
}
