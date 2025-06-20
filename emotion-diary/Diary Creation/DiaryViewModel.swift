//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by 이종원 on 6/19/25.
//

import Foundation
import SwiftUI
import Combine

final class DiaryViewModel: ObservableObject {
    
    @Published var diaries: Binding<[MoodDiary]>
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    @Published var date: Date = Date()
    @Published var mood: Mood = .great
    @Published var isPresented: Binding<Bool>
    @Published var text: String = ""
    
    var subscription = Set<AnyCancellable>()
    
    
    init(isPresented: Binding<Bool>, diaries: Binding<[MoodDiary]>) {
        self.isPresented = isPresented
        self.diaries = diaries
        
        $date.sink { date in
            self.update(date: date)
        }.store(in: &subscription)
        
        
        $mood.sink { [self] mood in
            self.update(mood: mood)
        }.store(in: &subscription)
        
        $text.sink { text in
            self.update(text: text)
        }.store(in: &subscription)
        
    }
    
    private func update(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        self.diary.date = formatter.string(from: date)
    }
    
    private func update(mood: Mood) {
        self.diary.mood = mood
    }
    
    private func update(text: String){
        self.diary.text = text
    }
    
    func completed() {
        guard diary.date.isEmpty == false else {return}
        
        diaries.wrappedValue.append(diary)
        print("전체리스트 추가")
        isPresented.wrappedValue = false
    }
}
