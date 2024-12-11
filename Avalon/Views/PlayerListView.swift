import SwiftUI

struct PlayerListView: View {
    @StateObject private var playerManager = PlayerManager()
    @State private var newPlayerName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(playerManager.players) { player in
                        Text(player.name)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { playerManager.removePlayer(at: $0) }
                    }
                }
                
                HStack {
                    TextField("Nouveau joueur", text: $newPlayerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Ajouter") {
                        guard !newPlayerName.isEmpty else { return }
                        playerManager.addPlayer(name: newPlayerName)
                        newPlayerName = ""
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                NavigationLink(destination: PlayerSelectionView()) {
                    Text("Démarrer une partie")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Joueurs")
        }
    }
}
