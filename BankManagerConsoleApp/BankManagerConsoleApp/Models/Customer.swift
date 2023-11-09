struct Customer: Identifiable {
    let id: Int
    private(set) var task: Taskable.Type
}
