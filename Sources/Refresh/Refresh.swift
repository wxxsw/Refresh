
import SwiftUI

@available(iOS 13.0, *)
public struct Refresh<Content: View> {
    
    let content: (Parameter) -> Content

    public init(_ position: Position, @ViewBuilder content: @escaping (Parameter) -> Content) {
        self.content = content
    }
}

@available(iOS 13.0, *)
extension Refresh {
    
    public enum Position {
        case top
        case bottom
    }
    
    public typealias Parameter = (isRefreshing: Bool, progress: CGFloat)
}

@available(iOS 13.0, *)
extension Refresh: View {
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                EmptyView()
            }
            .onAppear { print(proxy.frame(in: .global)) }
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
//        .frame(height: 0)
//        .frame(maxHeight: 0)
//        Section(header:
//            GeometryReader { proxy in
//                Color.clear.preference(key: TestKey.self, value: [proxy.frame(in: .global)])
//            }
//            .frame(height: 0)
//            .onPreferenceChange(TestKey.self, perform: { frame in
//                print(frame)
//            })) {
//                EmptyView()
//        }
//        .frame(height: 0)
    }
}

struct TestKey: PreferenceKey {
    
    static var defaultValue: [CGRect] = []
    
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}
