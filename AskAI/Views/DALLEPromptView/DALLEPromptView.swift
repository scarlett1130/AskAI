//
//  DALLEView.swift
//  OpenAIProject
//
//  Created by christian on 2/7/23.
//

import SwiftUI

struct DALLEPromptView: View {
    @ObservedObject var viewModel: OpenAIViewModel
    
    let engine: Engine
    
    var body: some View {
        VStack {
            ResponseView(viewModel: viewModel, savedChats: SavedChats(), engine: engine)
            
            Section {
                RequestView(viewModel: viewModel, engine: engine)
            } header: {
                Text("Generate an image with Artificial Intelligence.")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .padding(2)
            }
            
            ProgressButton(viewModel: viewModel, engine: engine)
                .padding(.vertical, -50)
        }
        .padding(8)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Ask DALL-E")
    }
}

struct DALLEView_Previews: PreviewProvider {
    static var previews: some View {
        DALLEPromptView(viewModel: OpenAIViewModel.example, engine: .DALLE)
    }
}
