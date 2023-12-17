protocol AppReducerProtocol {
    mutating func reduce(_ currentState: AppState,
                         _ action: AppAction) -> AppState
}

struct AppReducer: AppReducerProtocol {
    
    private(set) var collageReducer: CollageReducerProtocol
    private(set) var gestureReducer: GestureReducerProtocol
    
    mutating func reduce(_ currentState: AppState,
                         _ action: AppAction) -> AppState {
        
        var newState = currentState
        
        switch action {
        case .changeCollage(let modification):
            newState = changeCollage(modification, state: newState)
            
        case .setCollage(let collage):
            newState.collage = collage
