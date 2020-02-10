import XCTest
import HashedFS
@testable import DittoFS

final class DittoFSTests: XCTestCase {
    func testExample() {
        let rootDirectory = "jbao"
        let childDirectory = "Documents"
        let fileName = "File.txt"
        let fileContents = "Hello World"
        
        let ditto = DittoFS([])!
        let emptyHFS = HashedFS256.empty()
        let firstDitto = ditto.save(newValue: emptyHFS)!
        let mkdir = emptyHFS.makeDirectory([rootDirectory, childDirectory])!
        let secondDitto = firstDitto.save(newValue: mkdir)!
        let fileCreated = mkdir.createFile([rootDirectory, childDirectory, fileName], contents: fileContents)!
        let thirdDitto = secondDitto.save(newValue: fileCreated)!
        
        XCTAssert(thirdDitto.get()!.artifact!.getFile([rootDirectory, childDirectory, fileName]) != nil)
        XCTAssert(thirdDitto.get()!.artifact!.getFile([rootDirectory, childDirectory, fileName])! == fileContents)
        XCTAssert(thirdDitto.get()!.artifact!.listFiles([rootDirectory, childDirectory]) != nil)
        XCTAssert(thirdDitto.get()!.artifact!.listFiles([rootDirectory, childDirectory])!.contains(fileName))
        
        XCTAssert(thirdDitto.get(1)!.artifact!.listFiles([rootDirectory, childDirectory]) != nil)
        XCTAssert(!thirdDitto.get(1)!.artifact!.listFiles([rootDirectory, childDirectory])!.contains(fileName))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
