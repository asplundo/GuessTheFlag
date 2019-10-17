import SwiftUI

struct FlagImageView: View {
    
    var assetsName: String
    
    var body: some View {
        Image(assetsName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct FlagImageView_Previews: PreviewProvider {
    static var previews: some View {
        FlagImageView(assetsName: "Italy")
    }
}
