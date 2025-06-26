import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing:0){
            Text("\(coin.rank)")
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 40)
            Circle()
                .frame(width: 30,height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(Color.theme.accent)
            Spacer()
            
            if showHoldingsColumn{
                VStack(alignment: .trailing){                    Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                        .bold()
                    Text((coin.currentHoldings ?? 0).asNumberString())
                }
                .foregroundColor(Color.theme.accent)
                
            }
            VStack{
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0)>=0 ?
                        Color.theme.Up : Color.theme.Down
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
        }
    }
}

struct CoinRowView_Preview: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
