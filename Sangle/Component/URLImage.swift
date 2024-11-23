import SwiftUI

extension Image {
   struct Async: View {
       let string: String
       let width: CGFloat?
       let height: CGFloat?
       let radius: CGFloat?
       
       init(
           string: String,
           width: CGFloat? = nil,
           height: CGFloat? = nil,
           radius: CGFloat? = nil
       ) {
           self.string = string
           self.width = width
           self.height = height
           self.radius = radius
       }
        
       var body: some View {
           AsyncImage(url: URL(string: string)) { phase in
               switch phase {
               case .empty:
                   Rectangle()
                       .fill(Color(hex: "#f2f2f2"))
                       .frame(
                           width: width,
                           height: height
                       )
                       .clipShape(
                           RoundedRectangle(cornerRadius: radius ?? 0)
                       )
               case .success(let image):
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(
                           width: width,
                           height: height
                       )
                       .clipShape(
                           RoundedRectangle(cornerRadius: radius ?? 0)
                       )
               case .failure:
                   Image(systemName: "photo")
                       .foregroundColor(.gray)
                       .frame(
                           width: width,
                           height: height
                       )
               @unknown default:
                   EmptyView()
               }
           }
       }
   }
}

#Preview {
   VStack(spacing: 20) {
       // 크기만 지정
       Image.Async(
           string: "https://picsum.photos/200",
           width: 200,
           height: 200
       )
       
       // 크기와 radius 지정
       Image.Async(
           string: "https://picsum.photos/200",
           width: 200,
           height: 200,
           radius: 20
       )
       
       // radius만 지정
       Image.Async(
           string: "https://picsum.photos/200",
           radius: 20
       )
   }
}
