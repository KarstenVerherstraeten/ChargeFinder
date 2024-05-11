import Foundation
import Network

class NetworkManager: ObservableObject {
    static let shared = NetworkManager() // Singleton instance
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected: Bool = false
    @Published var isLoading: Bool = false // Optional: Add loading state
    
    private init() {
        // Initialize the monitor but don't start it immediately
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                print("Network status updated. isConnected: \(self?.isConnected ?? false)")
            }
        }
    }
    
    func startMonitoring() {
        // Start the monitor after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Adjust the delay as needed
            self.monitor.start(queue: self.queue)
        }
    }
    
    func checkInternetConnection() {
        isLoading = true // Optional: Set loading state to true while checking
        
        // Perform asynchronous check for internet connection
        DispatchQueue.global(qos: .background).async {
            let isConnected = self.isConnected // Get the current value of isConnected
            
            // Simulate a delay (remove this in production)
            sleep(2)
            
            DispatchQueue.main.async {
                self.isConnected = isConnected // Update isConnected to trigger UI refresh
                self.isLoading = false // Optional: Set loading state to false after checking
            }
        }
    }
}
