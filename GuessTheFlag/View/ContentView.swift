import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State var selectedAnswer = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                    .font(.largeTitle)
                    .fontWeight(.black)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                ForEach(0..<3) { number in
                    Button(action: {
                        self.selectedAnswer = number
                        self.flagTapped()
                    }) {
                        FlagImageView(assetsName: self.countries[number])
                    }
                }
                HStack {
                    Text("Score: ")
                    Spacer()
                    Text("\(score)")
                }.padding(.horizontal)
                Spacer()
            }
            .foregroundColor(.white)
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                if self.selectedAnswer != self.correctAnswer {
                    self.score = 0
                }
                self.askQuestion()
            })
        }
    }
    
    func flagTapped() {
        if selectedAnswer == correctAnswer {
            scoreTitle = "correct"
            score += 1
        } else {
            scoreTitle = "Wrong thats the flag of \(countries[selectedAnswer])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
