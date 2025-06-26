import Foundation

class HomeViewModel : ObservableObject{
    
    @Published var allcoin: [CoinModel]=[]
    @Published var portfolioCoins : [CoinModel]=[]
        
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.allcoin.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
