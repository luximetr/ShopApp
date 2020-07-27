import SwiftUI

struct PageView<Page: View>: View {
  var viewControllers: [UIHostingController<Page>]
  @Binding var currentPage: Int
  
  init(_ views: [Page], currentPage: Binding<Int>) {
    self._currentPage = currentPage
    self.viewControllers = views.map { UIHostingController(rootView: $0) }
  }
  
  var body: some View {
    PageViewController(controllers: viewControllers, currentPage: $currentPage)
  }
}

struct PageView_Previews: PreviewProvider {
  @State static var page = 0
  static var previews: some View {
    PageView([
      Text("Page0"),
      Text("Page1")
    ], currentPage: $page)
  }
}
