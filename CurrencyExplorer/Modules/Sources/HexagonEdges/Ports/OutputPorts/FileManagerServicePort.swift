import Foundation

public protocol FileManagerServicePort  {
    @discardableResult func saveFile(name: String, content: Data) -> Bool
    func readFile(name: String, completion: (Data?) -> Void)
}
