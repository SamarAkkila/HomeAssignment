//
//  Untitled.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/30/25.
//
import XCTest
@testable import RecipesApp

final class RecipeServiceTests: XCTestCase {
    
    func testFetchRecipesSuccess() async throws {
        let service = APIService()
        let recipes = try await service.fetchData()

        XCTAssertFalse(recipes.isEmpty, "Expected non-empty recipe list")
        XCTAssertNotNil(recipes.first?.name)
        XCTAssertNotNil(recipes.first?.cuisine)
    }

    func testMalformedDataHandling() async {
        
        let malformedURL = URL(string: Constants.URLs.MalformedData)!
        let service = APIService(testURL: malformedURL)
   
        
        do {
            _ = try await service.fetchData()
            XCTFail("Expected error for malformed data")
        } catch ServiceError.malformedData {
        
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testEmptyDataHandling() async {
        let emptyURL = URL(string: Constants.URLs.EmptyData)!
        let service = APIService(testURL: emptyURL)

        do {
            _ = try await service.fetchData()
            XCTFail("Expected error for empty data")
        } catch ServiceError.emptyData {
       
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
