//
//  MoneyDetailView.swift
//  BankCorrectApp
//
//  Created by Yunus Emre Bayezit on 24.08.2023.
//

import SwiftUI
import WebKit

struct MoneyDetailView: View {
    
    @State var moneyName = ""
    @State var moneyPrice = 0
    @Binding var selectedOption : Int
    @State var money = ["usd", "eur", "jpy", "gbp", "chf", "try"]
    @Binding var id : Int
   
    var body: some View {
        HStack {
            //Text("TradingView sayfasını açıcak")
            //Text("WebKit kullanılarak yapılacak")
            
            // https://www.investing.com/currencies/usd-try
            NavigationView {
                //WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-\(money[id])")
                // Bu money'i eklediğimde son kısma hata veriyor nedenini bulamadım
                //WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-\(money[selectedOption])")
                
                
                
                
                
                
                // Cell1'den id değişkeni gelmiyor  -> ondan dolayı 401 veriyor bu yapılmalı 
                
                
                
                
                
                WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-eur")
                
                /*
                switch id {
                case 0:
                    WebView(urlString: "https://www.investing.com/")
                    
                case 1:
                    WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-eur")
                    
                case 2:
                    WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-jpy")
                
                case 3:
                    WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-gbp")
                case 4:
                    WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-chf")
                    
                case 5:
                    WebView(urlString: "https://www.investing.com/currencies/\(money[selectedOption])-try")
                    
                default:
                    WebView(urlString: "https://www.investing.com/")
                }*/
            }
        }
    }
}




struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct MoneyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyDetailView(selectedOption: .constant(0), id: .constant(0))
    }
}





/// UIViewRepresentable, SwiftUI'da UIKit veya diğer UIKit tabanlı framework'leri SwiftUI içinde kullanmanıza olanak tanıyan bir protokoldür. UIKit veya diğer UIView tabanlı yapıları, SwiftUI'nin view yapısına dönüştürmek ve bu view yapısını SwiftUI içinde kullanmak için kullanılır.
/// UIViewRepresentable, iki ana fonksiyona sahiptir:
/// makeUIView(context:): Bu fonksiyon, SwiftUI'nin bir UIView örneği oluşturmasını sağlar. Bu UIView örneği, SwiftUI view hiyerarşisinin bir parçası olacak ve bu yapıyı temsil edecektir.
/// updateUIView(_:context:): Bu fonksiyon, SwiftUI view'i güncellemek için kullanılır. Eğer ilgili UIKit view'i değiştirilirse, bu fonksiyon kullanılır.
/// Bu protokol sayesinde, UIKit tabanlı yapıları, özel çizimler, haritalar, kamera görüntüsü veya WKWebView gibi web içerikleri gibi SwiftUI içinde kullanabilirsiniz.
/// Örnek olarak, yukarıda verdiğim WebView örneği UIViewRepresentable'ı kullanarak WKWebView'i SwiftUI içinde kullanabilmektedir. Bu şekilde SwiftUI ve UIKit arasında geçiş yaparak, her iki framework'ün gücünden de yararlanabilirsiniz.
/// URL(string: urlString): Bu satır, urlString adlı String değerini bir URL nesnesine dönüştürmeye çalışır. Eğer urlString geçerli bir URL formatına sahipse, bu dönüşüm başarılı olur ve url adında bir URL nesnesi oluşturulur. Eğer dönüşüm başarısız olursa (örneğin, geçersiz bir URL formatı), url nil değeri alır.
/// let request = URLRequest(url: url): Eğer url nil değilse (yani geçerli bir URL dönüşümü gerçekleştiyse), bu satır url nesnesini kullanarak bir URLRequest nesnesi oluşturur. URLRequest nesnesi, belirtilen URL'ye bir istek yapmak için kullanılır.
/// uiView.load(request): Bu satır, oluşturulan URLRequest nesnesini kullanarak WKWebView içerisine belirtilen URL'yi yüklemeye çalışır. Yani, WKWebView belirtilen URL'ye gidip web içeriğini yüklemeye çalışır.
/// Sonuç olarak, bu kod bloğu, WebView içindeki WKWebView nesnesine belirtilen URL'yi yüklemek için kullanılır. Bu sayede, SwiftUI arayüzünde tanımlanan WebView içeriği, belirtilen URL'ye göre görüntülenir.
