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
    var prev: Bool = false
}

struct AnalysisMonthlyGraph: View {
    let chartData: Array<ChartData>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(chartData) { data in
                AnalysisMonthlyGraphItem(data: data)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 32)
        .padding(.bottom, 20)
        .frame(width: 353, alignment: .topLeading)
        .cornerRadius(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(Color(red: 0.87, green: 0.87, blue: 0.87), lineWidth: 1)
        )
    }
}

struct AnalysisMonthlyGraphItem: View {
    let data: ChartData
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 12) {
                Rectangle()
                    .fill(Color.Color.green)
                    .cornerRadius(12)
                    .frame(width: geometry.size.width * (Double(data.value) / 100), height: 36)
                Text("\(data.month)월")
                    .typography(.body1, color: data.prev ? Color.Gray._500 : .black)
            }
        }
        .frame(maxWidth: .infinity, idealHeight: 68)
    }
}

#Preview {
    AnalysisMonthlyGraph(chartData: [
        ChartData(
            month: 8,
            value: 70,
            prev: true
        ),
        ChartData(
            month: 9,
            value: 35
        ),
        ChartData(
            month: 10,
            value: 80
        ),
        ChartData(
            month: 11,
            value: 50
        ),
    ])
}
