import SwiftUI

struct FirstLaunchView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true

    var body: some View {
        VStack {
            Image("Logo") // Assuming you have an image named "Logo" in your asset catalog
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150) // Adjust the size as needed
                .padding(.top, 100)
                .padding(.bottom, 10)



            HStack(spacing: 0) {
                Text("Charge")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("Finder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
            .padding(.bottom, 10)

            Text("Vind snel elektrische laadpalen op de kaart, waar je ook bent. Nooit meer zorgen over lege batterijen onderweg!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
           

            Button(action: {
                isFirstLaunch = false
            }) {
                Text("Betreed een niew tijdperk")
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .padding()
    }
}

struct FirstLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        FirstLaunchView()
    }
}
