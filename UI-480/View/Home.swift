//
//  Home.swift
//  UI-480
//
//  Created by nyannyan0328 on 2022/02/25.
//

import SwiftUI

struct Home: View {
    @State var show : Bool = false
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            CubicTranslation(show: $show) {
                
                
                ZStack{
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        
                    
                    
                    Button {
                        
                        
                        show.toggle()
                    } label: {
                        
                       
                        Text("Navigate")
                            .font(.title.weight(.bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                            .environment(\.colorScheme, .dark)
                          
                        
                        
                        
                        
                    }
                }

                
            } detail: {
                
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                
            }

            
        }
        .ignoresSafeArea()
        .overlay(alignment: .top) {
            
            
            HStack{
                
            
                if show{
                    
                    Button {
                        show.toggle()
                        
                    } label: {
                        
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }

                    
                }
                
                
                Text(show ? "Back" : "Custom Tanslation")
                    .font(.title.weight(.heavy))
                    .foregroundColor(.white)
            
                 
                    
                   
                      
              
            }
            .padding()
            .padding(.top,3)
            .frame(maxWidth:.infinity,alignment: .leading)
            .background(.ultraThinMaterial)
           
        }
        .onTapGesture {
            
            show.toggle()
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
