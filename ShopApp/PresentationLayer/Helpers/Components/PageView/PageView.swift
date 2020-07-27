import SwiftUI

struct PageView<Page: View>: View {
  var viewControllers: [UIHostingController<Page>]
  @Binding var currentPage: Int
  
  init(_ views: [Page], currentPage: Binding<Int>) {
    self.viewControllers = views.map { UIHostingController(rootView: $0) }
    self._currentPage = currentPage
  }
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      PageViewController(controllers: viewControllers, currentPage: $currentPage)
    }
  }
}

struct PageView_Previews: PreviewProvider {
  @State static var currentPage = 0
  static var previews: some View {
    PageView([
      Text("Page1"),
      Text("Page2")
    ],
             currentPage: $currentPage)
  }
}
