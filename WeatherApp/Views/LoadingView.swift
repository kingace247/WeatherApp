//
//  LoadingView.swift
//  WeatherApp
//
//  Created by David Garza on 1/19/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
