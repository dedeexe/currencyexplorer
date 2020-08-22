import Foundation

public final class SessionManager: Session {

    public static let shared: SessionManager = {
        return SessionManager()
    }()

    public var accessToken: String {
        return Config.accessKey
    }
}
