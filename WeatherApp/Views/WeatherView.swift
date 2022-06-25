//
//  WeatherView.swift
//  WeatherApp
//
//  Created by David Garza on 2/3/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.haze")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.temp.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                   
                ZStack{
                Image("new-york-skyline-299623931")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                        .offset(y: -250)
                
                    VStack{
                        
                        VStack(alignment: .leading, spacing: 20){
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Weather now")
                                    .bold()
                                    .padding(.bottom)

                                HStack {
                                    WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                                    Spacer()
                                    WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                                }

                                HStack {
                                    WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                                    Spacer()
                                    WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom, 100)
                        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                        .background(.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .preferredColorScheme(.dark)
            }
        }
    }
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }
