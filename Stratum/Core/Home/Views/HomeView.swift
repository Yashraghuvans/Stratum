import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showPortfolio:Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                homeHeader
                columnTitles
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View { 
        NavigationView {
            HomeView()
                .toolbar(.hidden, for: .navigationBar)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView{
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
            Spacer()
            Text(showPortfolio ? "Protfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View{
        List{
            ForEach(vm.allcoin){coin in
                CoinRowView(coin: coin, showHoldingsColumn:false)
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portfolioCoinsList: some View{
        List{
            ForEach(vm.portfolioCoins){coin in
                CoinRowView(coin: coin, showHoldingsColumn:true)
            }
        }
        .listStyle(PlainListStyle())
    }
    private var columnTitles: some View{
        HStack{
            Text("Coin")
                .padding(.leading,50)
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
                .padding(.trailing,40)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
        .padding(.top)
    }
}
