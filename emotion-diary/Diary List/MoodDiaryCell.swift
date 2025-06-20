//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by 이종원 on 6/19/25.
//

import SwiftUI

struct MoodDiaryCell: View {
    var diary: MoodDiary
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

#Preview {
    MoodDiaryCell(diary: MoodDiary.list.first!)
}
