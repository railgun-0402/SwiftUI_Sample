import SwiftUI

struct ContentView: View {
    @State private var countdownTime = 60
    @State private var currentTime = 60
    @State private var isRunning = false
    @State private var timerType = "Countdown"
    
    var body: some View {
        VStack {
            Text("\(currentTime)")
                .font(.largeTitle)
            Spacer().frame(height: 20)
            Button(isRunning ? "Stop" : "Start") {
                if isRunning {
                    stopTimer()
                } else {
                    startTimer()
                }
            }
        }
    }
    
    func startTimer() {
        isRunning = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if currentTime == 0 {
                stopTimer()
            } else {
                currentTime -= 1
            }
        }
    }
    
    func stopTimer() {
        isRunning = false
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
