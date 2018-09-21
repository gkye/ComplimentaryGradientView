//
//  Combinatorics.swift
//  Combinatorics
//
//  Created by Albert Mata Guerra on 29/07/16.
//  Copyright © 2016 Albert Mata Guerra. All rights reserved.
//

import Foundation

/// Combinatorics contains static functions to generate k-permutations and k-combinations
/// (in both cases either with or without repetition) of the n elements in an array.
public struct Combinatorics {
  
  // MARK: - Permutations
  
  /// Given an array of elements and how many of them we are taking, returns an array with all possible permutations
  /// without repetition. Please note that as repetition is not allowed, taking must always be less or equal to
  /// `elements.count`.
  /// Almost by convention, if `taking` is 0, the function will return [[]] (an array with only one possible permutation
  /// - a permutation with no elements). In a different scenario, if `taking` is bigger than `elements.count` the function
  /// will return [] (an empty array, so including no permutation at all).
  ///
  /// - Parameters:
  ///   - elements: Array to be permutating.
  ///   - taking: Picking item count from array.
  /// - Returns: Returns permutations of elements without repetition.
  public static func permutationsWithoutRepetitionFrom<T>(_ elements: [T], taking: Int) -> [[T]] {
    guard elements.count >= taking else { return [] }
    guard elements.count >= taking && taking > 0 else { return [[]] }
    
    if taking == 1 {
      return elements.map {[$0]}
    }
    
    var permutations = [[T]]()
    for (index, element) in elements.enumerated() {
      var reducedElements = elements
      reducedElements.remove(at: index)
      permutations += permutationsWithoutRepetitionFrom(reducedElements, taking: taking - 1).map {[element] + $0}
    }
    
    return permutations
  }
  
}
