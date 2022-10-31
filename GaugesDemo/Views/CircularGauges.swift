import SwiftUI

struct CircularGauges: View {
    @State private var value = 0.0

    private var maximum = 10.0
    private var minimum = 0.0

    var body: some View {
        NavigationStack {
            Form {
                Section("AccessoryCircular") {
                    Text("""
                    The currentValueLabel appears in the center.
                    The optional minimumValueLabel and maximumValueLabel appear
                    in the opening at the bottom of the ring.
                    Otherwise, the label appears there.
                    """)
                    .font(.caption)
                    HStack {
                        Gauge(
                            value: value,
                            in: minimum ... maximum,
                            label: {
                                Text("Rating").foregroundColor(.purple)
                                    .scaleEffect(0.75)
                            },
                            currentValueLabel: {
                                Text("\(Int(value))").foregroundColor(.purple)
                            }
                        )
                        .gaugeStyle(.accessoryCircular)
                        .scaleEffect(1.5)
                        .padding()
                        .tint(.teal)

                        Gauge(
                            value: value,
                            in: minimum ... maximum,
                            label: { Text("not displayed") },
                            currentValueLabel: {
                                Text("\(Int(value))").foregroundColor(.purple)
                            }, minimumValueLabel: {
                                Text("\(Int(minimum))").foregroundColor(.purple)
                            }, maximumValueLabel: {
                                Text("\(Int(maximum))").foregroundColor(.purple)
                            }
                        )
                        .gaugeStyle(.accessoryCircular)
                        .scaleEffect(1.5)
                        .padding()
                        .tint(.teal)
                    }
                }
                .textCase(nil)

                Section("AccessoryCircularCapacity") {
                    Text("""
                    The currentValueLabel appears in the center and no other argument labels are used.
                    """)
                    .font(.caption)
                    Gauge(
                        value: value,
                        in: minimum ... maximum
                    ) {} currentValueLabel: {
                        Text("\(Int(value))").foregroundColor(.red)
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .scaleEffect(1.5)
                    .padding()
                    .tint(.red)
                }
                .textCase(nil)
            }
            .navigationTitle("Circular Gauges")

            Spacer()
            Slider(value: $value, in: minimum ... maximum)
                .padding()
        }
    }
}
