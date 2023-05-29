//
//  ContentView.swift
//  AllSatisfy
//
//  Created by Jae kwon Choi on 2023/05/29.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = ContentViewModel()
    
    var body: some View {
        VStack {
            
            HStack {
                Text("모두 동의 여부")
                    .foregroundColor(Color.black)
                    .font(Font.custom("Pretendard-SemiBold", fixedSize: 18))
                Text(model.allMarketingTermAgreed.description)
            }
            
            Button {
                self.model.allAgree()
            } label: {
                HStack {
                    Image(self.model.allMarketingTermAgreed ? "icoCheckSelect" : "icoRadio")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 15, height: 15)
                    
                    Text("모두 동의 하시겠습니까?")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Pretendard-SemiBold", fixedSize: 14))
                }
            }
            
            Button {
                model.emailMarketingAgreed.toggle()
            } label: {
                HStack {
                    Image(self.model.emailMarketingAgreed ? "icoCheckSelect" : "icoRadio")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 15, height: 15)
                    
                    Text("이메일 동의")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Pretendard-SemiBold", fixedSize: 14))
                }
            }
            
            Button {
                model.phoneMarketingAgreed.toggle()
            } label: {
                HStack {
                    Image(self.model.phoneMarketingAgreed ? "icoCheckSelect" : "icoRadio")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 15, height: 15)
                    
                    Text("전화번호 동의")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Pretendard-SemiBold", fixedSize: 14))
                }
            }
        }
        .padding()
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
