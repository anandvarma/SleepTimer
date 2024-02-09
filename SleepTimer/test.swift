import SwiftUI

struct ContentView2: View {
    @State private var isTimerRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("Hello, World!")

            Button(action: {
                if isTimerRunning {
                    // Stop the timer
                    timer?.invalidate()
                    timer = nil
                } else {
                    // Start the timer
                    timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                        print("Hello, World!")
                    }
                }

                // Toggle the timer state
                isTimerRunning.toggle()
            }) {
                Text(isTimerRunning ? "Stop Timer" : "Start Timer")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
