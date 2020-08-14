/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that wraps a UIPageViewController.
 */

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
  var controllers: [UIViewController]
  @Binding var currentPage: Int
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal)
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    
    return pageViewController
  }
  
  // MARK: - Update
  
  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    guard !controllers.isEmpty else { return }
    let nextVC = controllers[currentPage]
    let selectedPageIndex = getSelectedPageIndex(pageVC: pageViewController)
    let direction = getPageShowDirection(currentIndex: selectedPageIndex, nextIndex: currentPage)
    pageViewController.setViewControllers([nextVC], direction: direction, animated: true)
  }
  
  private func getSelectedPageIndex(pageVC: UIPageViewController) -> Int {
    guard let currentPageVC = pageVC.viewControllers?.first else { return 0 }
    guard let currentPageIndex = controllers.firstIndex(of: currentPageVC) else { return 0 }
    return currentPageIndex
  }
  
  private func getPageShowDirection(currentIndex: Int, nextIndex: Int) -> UIPageViewController.NavigationDirection {
    return nextIndex > currentIndex ? .forward : .reverse
  }
  
  // MARK: - Coordinator
  
  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController
    
    init(_ pageViewController: PageViewController) {
      self.parent = pageViewController
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return nil
      }
      return parent.controllers[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == parent.controllers.count {
        return nil
      }
      return parent.controllers[index + 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
      if completed,
        let visibleViewController = pageViewController.viewControllers?.first,
        let index = parent.controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }
}
