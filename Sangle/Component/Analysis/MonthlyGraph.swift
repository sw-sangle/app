//
//  MonthlyGraph.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct ChartData: Identifiable {
    let id = UUID()
    var month: Int
    var value: Int {
        didSet {
            value = min(max(value, 0), 100)
        }
    }
    var ingredientsCount: Int
}

struct AnalysisMonthlyGraph: View {
    let title: String
    let chartData: Array<ChartData>
    let chartColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(title)
                .typography(.subtitle2Emphasized)
            ForEach(chartData) { data in
                AnalysisMonthlyGraphItem(data: data, color: chartColor)
            }
        }
        .padding(20)
        .background(Color.Gray._150)
        .cornerRadius(12)
    }
}

struct AnalysisMonthlyGraphItem: View {
    let data: ChartData
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Text("\(data.month)월")
                    .typography(.subtitle2)
                Text("등록된 식재료: \(data.ingredientsCount)개")
                    .typography(.body1, color: Color.Gray._500)
            }
            GeometryReader { geometry in
                HStack(alignment: .bottom) {
                    Rectangle()
                        .fill(color)
                        .cornerRadius(12)
                        .frame(width: (geometry.size.width - 55) * (Double(data.value) / 100), height: 36)
                    Spacer()
                    Text("\(data.value)%")
                        .typography(.subtitle2)
                }
            }
            .frame(maxWidth: .infinity, idealHeight: 36)
        }
    }
}

#Preview {
    AnalysisMonthlyGraph(
        title: "버려지지 않은 식재료",
        chartData: [
            ChartData(
                month: 8,
                value: 70,
                ingredientsCount: 10
            ),
            ChartData(
                month: 9,
                value: 35,
                ingredientsCount: 10
            ),
            ChartData(
                month: 10,
                value: 100,
                ingredientsCount: 10
            ),
            ChartData(
                month: 11,
                value: 50,
                ingredientsCount: 10
            ),
        ],
        chartColor: Color.Color.green
    )
}
