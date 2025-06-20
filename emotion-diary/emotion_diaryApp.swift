//
//  emotion_diaryApp.swift
//  emotion-diary
//
//  Created by 이종원 on 6/16/25.
//

import SwiftUI

@main
struct emotion_diaryApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = DiaryListViewModel(storage: MoodDiaryStorage())
            DiaryListView(vm: vm)
        }
    }
}
