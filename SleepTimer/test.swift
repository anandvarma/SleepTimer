import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack {
            Button("Sleep") {
                putMacToSleep()
            }
            .padding()
        }
    }

    private func putMacToSleep() {
        let appleScript = """
            do shell script "pmset sleepnow"
        """

        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: appleScript) {
            scriptObject.executeAndReturnError(&error)
        }

        if let error = error {
            print("Error putting Mac to sleep: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
