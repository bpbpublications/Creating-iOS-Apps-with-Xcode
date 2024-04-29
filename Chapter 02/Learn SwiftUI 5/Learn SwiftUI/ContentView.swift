//
//  ContentView.swift
//  Learn SwiftUI
//
//  Created by Aaron Bratcher on 6/23/23.
//

import SwiftUI

enum Shape: String, CaseIterable {
	case circle, rectangle, roundedRectangle, unevenRoundedRectangle, capsule, ellipse, customShape
}

extension Shape: Identifiable {
	var id: Shape { return self }
}

// Because an enum name Shape was defined above, it would take precedence of Shape from an imported module. To overcome this, the full Module.Protocol syntax is used.
struct Star: SwiftUI.Shape {
	func path(in rect: CGRect) -> Path {
		let point1 = CGPoint(x: rect.midX, y: 0)
		let point2 = CGPoint(x: rect.width * 0.62, y: rect.height * 0.375)
		let point3 = CGPoint(x: rect.width, y: rect.height * 0.375)
		let point4 = CGPoint(x: rect.width * 0.694, y: rect.height * 0.613)
		let point5 = CGPoint(x: rect.width * 0.804, y: rect.height)
		let point6 = CGPoint(x: rect.midX, y: rect.height * 0.762)
		let point7 = CGPoint(x: rect.width * 0.196, y: rect.height)
		let point8 = CGPoint(x: rect.width * 0.306, y: rect.height * 0.613)
		let point9 = CGPoint(x: 0, y: rect.height * 0.375)
		let point10 = CGPoint(x: rect.width * 0.38, y: rect.height * 0.375)

		var path = Path()
		path.move(to: point1)
		path.addLine(to: point2)
		path.addLine(to: point3)
		path.addLine(to: point4)
		path.addLine(to: point5)
		path.addLine(to: point6)
		path.addLine(to: point7)
		path.addLine(to: point8)
		path.addLine(to: point9)
		path.addLine(to: point10)
		path.closeSubpath()
		return path
	}
}

struct ContentView: View {
	var circleShapes: some View {
		HStack {
			Circle()
				.stroke(Color.blue)
				.frame(height: 30)
			Circle()
				.foregroundStyle(Color.red)
				.frame(height: 30)
			ZStack {
				Circle()
					.foregroundStyle(Color.red)
					.padding(5)
					.frame(height: 30)
				Circle()
					.trim(from: 0.1, to: 0.9)
					.stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
					.frame(height: 30)
			}
		}
	}

	var rectangleShapes: some View {
		HStack {
			Rectangle()
				.stroke(Color.blue)
				.frame(width: 50, height: 30)
			Rectangle()
				.foregroundStyle(Color.red)
				.frame(width: 50, height: 30)
			Rectangle()
				.foregroundStyle(Color.red)
				.padding(5)
				.frame(width: 50, height: 30)
				.overlay {
					Rectangle()
						.trim(from: 0.1, to: 0.9)
						.stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
						.frame(width: 50, height: 30)
				}
		}
	}

	var roundedRectangleShapes: some View {
		HStack {
			RoundedRectangle(cornerRadius: 6)
				.stroke(Color.blue)
				.frame(width: 50, height: 30)
			RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
				.foregroundStyle(Color.red)
				.frame(width: 50, height: 30)

			ZStack {
				RoundedRectangle(cornerRadius: 6)
					.foregroundStyle(
						LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
					)
					.frame(width: 50, height: 30)
				RoundedRectangle(cornerRadius: 6)
					.stroke(Color.green, style: StrokeStyle(lineWidth: 4))
					.frame(width: 50, height: 30)
				RoundedRectangle(cornerRadius: 6)
					.trim(from: 0.1, to: 0.9)
					.stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
					.frame(width: 50, height: 30)
			}
		}
	}

	var unevenRoundedRectangleShapes: some View {
		HStack {
			UnevenRoundedRectangle(cornerRadii: .init(topLeading: 2, bottomLeading: 8, bottomTrailing: 2, topTrailing: 16))
				.stroke(Color.blue)
				.frame(width: 50, height: 30)
			UnevenRoundedRectangle(cornerRadii: .init(topLeading: 2, bottomLeading: 8, bottomTrailing: 2, topTrailing: 16))
				.foregroundStyle(Color.red)
				.frame(width: 50, height: 30)
			ZStack {
				UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 4, bottomTrailing: 2, topTrailing: 12))
					.foregroundStyle(Color.red)
					.padding(5)
					.frame(width: 50, height: 30)
				UnevenRoundedRectangle(cornerRadii: .init(topLeading: 2, bottomLeading: 8, bottomTrailing: 2, topTrailing: 16))
					.trim(from: 0.1, to: 0.9)
					.stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
					.frame(width: 50, height: 30)
			}
		}
	}

	var capsuleShapes: some View {
		HStack {
			Capsule()
				.stroke(Color.blue)
				.frame(width: 60, height: 30)
			Capsule()
				.foregroundStyle(Color.red)
				.frame(width: 60, height: 30)
			ZStack {
				Capsule()
					.foregroundStyle(Color.red)
					.padding(5)
					.frame(width: 60, height: 30)
				Capsule()
					.trim(from: 0.1, to: 0.9)
					.stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
					.frame(width: 60, height: 30)
			}
		}
	}

	var ellipseShapes: some View {
		HStack {
			Ellipse()
				.stroke(Color.blue)
				.frame(width: 50, height: 30)
			Ellipse()
				.foregroundStyle(Color.red)
				.frame(width: 50, height: 30)
			ZStack {
				Ellipse()
					.foregroundStyle(Color.red)
					.padding(5)
					.frame(width: 48, height: 30)
				Ellipse()
					.trim(from: 0.1, to: 0.9)
					.stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
					.frame(width: 50, height: 30)
			}
		}
	}

	var starShapes: some View {
		HStack {
			Star()
				.stroke(Color.blue)
				.frame(width: 30, height: 30)
			Star()
				.foregroundStyle(Color.red)
				.frame(width: 30, height: 30)
			Star()
				.foregroundStyle(Color.red)
				.padding(8)
				.frame(width: 40, height: 40)
				.overlay {
					Star()
						.trim(from: 0.1, to: 0.9)
						.stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round))
						.frame(width: 30, height: 30)
				}
		}
	}

	var body: some View {
		NavigationView {
			List {
				ForEach(Shape.allCases) { shape in
					Section(header: Text(shape.rawValue)) {
						switch shape {
						case .circle:
							circleShapes
						case .rectangle:
							rectangleShapes
						case .roundedRectangle:
							roundedRectangleShapes
						case .unevenRoundedRectangle:
							unevenRoundedRectangleShapes
						case .capsule:
							capsuleShapes
						case .ellipse:
							ellipseShapes
						case .customShape:
							starShapes
						}
					}
				}
			}
			.navigationBarTitle(Text("Shapes"))
		}
	}
}

#Preview {
	ContentView()
}
