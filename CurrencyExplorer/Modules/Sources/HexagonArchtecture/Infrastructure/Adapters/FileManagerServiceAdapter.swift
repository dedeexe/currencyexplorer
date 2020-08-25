import Foundation
import HexagonEdges

final class FileManagerServiceAdapter: FileManagerServicePort {

    func saveFile(name: String, content: Data) -> Bool {
        guard let path = homeDirectory()?.appendingPathComponent(name) else {
            return false
        }

        do {
            try content.write(to: path)
            return true
        } catch {
            return false
        }
    }

    func readFile(name: String, completion: (Data?) -> Void) {
        guard let path = homeDirectory()?.appendingPathComponent(name) else {
            completion(nil)
            return
        }

        do {
            let data = try Data(contentsOf: path)
            completion(data)
        } catch {
            completion(nil)
        }
    }

    private func homeDirectory() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
