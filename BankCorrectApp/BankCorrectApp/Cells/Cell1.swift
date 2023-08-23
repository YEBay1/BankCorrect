//
//  Cell1.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 22.08.2023.
//

import SwiftUI
import Alamofire

struct Cell1: View {
    @State private var animateGradient: Bool = false
    
    @Binding var selectedOption : Int
    @State var money = ["USD", "EUR", "JPY", "GBP", "CHF", "TRY"]
    @State var money2 = ["dollar", "euro", "yen", "sterling", "franc", "turkishlira"]
    @State var design = ["3Cell", "6Cell"]
    @State private var selectedDesign = 0
    @State var data1 = ""
    @State var moneyName = ""
    @State var selectedMoney = ""
    @State var dict = [String: String]()
    @Binding var price : [String]
    @State private var selected1 = 0
    @State var selectedMoney1 = ""
    @State var count = 0
    @State var correct = true
    
    private let startColor: Color = .blue
    private let endColor: Color = .cyan
    private let colorBlue: Color = .blue
    private let colorRed: Color = .red
    private let color11: Color = Color(red: 0.6, green: 0.2, blue: 1.0)
    private let color22: Color = Color(red: 0.9, green: 0.2, blue: 0.8)
    private let darkBlue: Color = Color(red: 0.3, green: 0.2, blue: 1.0)

    
    
    var body: some View {
        VStack {
            
            ScrollView {
                HStack {
                    HStack(spacing: 20) {
                        
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    Image(systemName: "\(money2[selectedOption])sign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                        .animation(.easeInOut)
                                    
        
                                    
                                    Text("\(money[selectedOption])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .animation(.easeInOut)
                                    
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 5) {
                                    
                                    Image(systemName: "dollarsign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    Text("\(money[0])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 5) {
                                
                                if price.count == 6 {
     
                                    HStack {
                                        
                                        Text("\(price[0])")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding()
                        .background {
                            LinearGradient(
                                colors: [color11, color22],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        
                    }
                    .cornerRadius(25)
                    
                    
                    HStack(spacing: 20) {
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    Image(systemName: "\(money2[selectedOption])sign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                        .animation(.easeInOut)
                                    
                                    
                                    Text("\(money[selectedOption])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .animation(.easeInOut)
                                    
                                }
                            
                                Spacer()
                                
                                VStack(spacing: 5) {
                                    
                                    Image(systemName: "eurosign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    Text("\(money[1])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 5) {
                                
                                if price.count == 6 {
                                    HStack {
                                        Text("\(price[1])")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding()
                        .background {
                            LinearGradient(
                                colors: [color22, color11],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        
                    }
                    .cornerRadius(25)
                }
                
                
                HStack {
                    HStack(spacing: 20) {
                        
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    Image(systemName: "\(money2[selectedOption])sign.circle")
                                        .animation(.easeInOut)
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    
                                    
                                    Text("\(money[selectedOption])")
                                        .animation(.easeInOut)
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 5) {
                                    
                                    Image(systemName: "yensign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    Text("\(money[2])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                                
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 5) {
                                
                                if price.count == 6 {
                                    HStack {
                                        Text("\(price[2])")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding()
                        .background {
                            LinearGradient(
                                colors: [color11, color22],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        
                    }
                    .cornerRadius(25)
                    
                    
                    HStack(spacing: 20) {
                        
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    Image(systemName: "\(money2[selectedOption])sign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                        .animation(.easeInOut)
                                    
                                    
                                    Text("\(money[selectedOption])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .animation(.easeInOut)
                                    
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 5) {
                                    
                                    Image(systemName: "sterlingsign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    Text("\(money[3])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                                
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 5) {
                                
                                if price.count == 6 {
                                    HStack {
                                        Text("\(price[3])")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding()
                        .background {
                            LinearGradient(
                                colors: [color22, color11],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        
                    }
                    .cornerRadius(25)
                }
                
                
                HStack {
                    HStack(spacing: 20) {
                        
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    Image(systemName: "\(money2[selectedOption])sign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                        .animation(.easeInOut)
                                    
                                    
                                    Text("\(money[selectedOption])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .animation(.easeInOut)
                                    
                                }
                                
                                 Spacer()
                                
                                VStack(spacing: 5) {
                                    
                                    Image(systemName: "francsign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    Text("\(money[4])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                                
                                
                                 
                                
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 5) {
                                
                                if price.count == 6 {
                                    HStack {
                                        Text("\(price[4])")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding()
                        .background {
                            LinearGradient(
                                colors: [color11, color22],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        
                    }
                    .cornerRadius(25)
                    
                    HStack(spacing: 20) {
                        
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    Image(systemName: "\(money2[selectedOption])sign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                        .animation(.easeInOut)
                                    
                                    
                                    Text("\(money[selectedOption])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .animation(.easeInOut)
                                    
                                }
                     
                                Spacer()
                                
                                VStack(spacing: 5) {
                                    
                                    Image(systemName: "turkishlirasign.circle")
                                        .foregroundColor(.white)
                                        .font(.system(size: 45))
                                    Text("\(money[5])")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                    
                                }
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 5) {
                                
                                if price.count == 6 {
                                    HStack {
                                        Text("\(price[5])")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 150, height: 150)
                        .padding()
                        .background {
                            LinearGradient(
                                colors: [color22, color11],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }
                        
                    }
                    .cornerRadius(25)
                }
                
            }
        }
    }
    
         
}

struct Cell1_Previews: PreviewProvider {
    static var previews: some View {
        Cell1(selectedOption: .constant(0) ,price: .constant([""]))
    }
}
