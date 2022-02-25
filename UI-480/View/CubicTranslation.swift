//
//  CubicTranslation.swift
//  UI-480
//
//  Created by nyannyan0328 on 2022/02/25.
//

import SwiftUI

struct CubicTranslation<Content : View,Detail : View>: View {
    
    var content : Content
    var detail : Detail
    @Binding var show : Bool
    
    init(show : Binding<Bool>,@ViewBuilder content : @escaping()->Content,@ViewBuilder detail : @escaping()->Detail) {
        self.content = content()
        self.detail = detail()
        self._show = show
    }
    
    @State var animationView : Bool = false
    @State var showView : Bool = false
    
    @State var taskItem : DispatchWorkItem?
    
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            
            HStack(spacing:0){
                
                
                content
                    .frame(width: size.width, height: size.height)
                    .rotation3DEffect(.init(degrees: animationView ? -85: 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing, anchorZ: 0, perspective: 1)
                    
                
                
                ZStack{
                    
                    
                    if showView{
                        
                        
                        detail
                            .frame(width: size.width, height: size.height)
                            .transition(.move(edge: .trailing))
                            
                    }
                
                    
                }
                .rotation3DEffect(.init(degrees: animationView ? 0 : 85), axis: (x: 0, y: 1, z: 0), anchor: .leading, anchorZ: 0, perspective: 1)
                
                
                
                
            }
            .offset(x: animationView ? -size.width : 0)
            
        }
        .onChange(of: show) { newValue in
            
            
            taskItem?.cancel()
            
            if show{showView = true}
            
            
            else{
                
                taskItem = .init{
                    
                    showView = false
                }
                
            }
            
            if let taskItem = taskItem {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: taskItem)
            }
            
            
            
            

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                
                withAnimation(.easeInOut(duration: 0.3)){
                    
                    animationView.toggle()
                }
                
                
            }
            

        }
    }
}

struct CubicTranslation_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
