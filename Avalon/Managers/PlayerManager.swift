import Foundation

class PlayerManager: ObservableObject {
    @Published var players: [Player] = []
    private let storageKey = "players_list"
    
    init() {
        loadPlayers()
    }
    
    func addPlayer(name: String) {
        let newPlayer = Player(name: name)
        players.append(newPlayer)
        savePlayers()
    }
    
    func removePlayer(at index: Int) {
        players.remove(at: index)
        savePlayers()
    }
    
    private func savePlayers() {
        if let data = try? JSONEncoder().encode(players) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    private func loadPlayers() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let savedPlayers = try? JSONDecoder().decode([Player].self, from: data) {
            players = savedPlayers
        }
    }
}
