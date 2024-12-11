import SwiftUI

struct PlayerSelectionView: View {
    @StateObject private var playerManager = PlayerManager()
    @State private var selectedPlayers: [Player] = []
    
    var body: some View {
        VStack {
            Text("Sélectionnez les joueurs pour la partie")
                .font(.headline)
                .padding()

            List(playerManager.players) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    if selectedPlayers.contains(where: { $0.id == player.id }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleSelection(for: player)
                }
            }
            
            Spacer()
            
            Button("Commencer la partie") {
                startGame()
            }
            .disabled(selectedPlayers.count < 5) // Minimum 5 joueurs pour Avalon
            .padding()
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Nouvelle Partie")
    }
    
    private func toggleSelection(for player: Player) {
        if let index = selectedPlayers.firstIndex(where: { $0.id == player.id }) {
            selectedPlayers.remove(at: index)
        } else {
            selectedPlayers.append(player)
        }
    }
    
    private func startGame() {
        // À connecter à la logique de jeu
        print("Joueurs sélectionnés : \(selectedPlayers.map { $0.name })")
    }
}
