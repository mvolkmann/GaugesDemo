import SwiftUI

struct CircularGauges: View {
    @State private var value = 0.0

    private var maximum = 100.0
    private var minimum = 0.0

    var body: some View {
        NavigationStack {
            Form {
                Section("accessoryCircular") {
                    Text("""
                    The currentValueLabel appears in the center. \
                    The optional minimumValueLabel and maximumValueLabel \
                    appear in the opening at the bottom of the ring. \
                    Otherwise, the label appears there.
                    """)
                    .font(.caption)
                    HStack {
                        Gauge(
                            value: value,
                            in: minimum ... maximum,
                            label: {
                                Text("Rating")
                                    .foregroundColor(.purple)
                                    .scaleEffect(0.75) // to fit at bottom
                            },
                            currentValueLabel: {
                                Text(value).foregroundColor(.purple)
                            }
                        )
                        .gaugeStyle(.accessoryCircular)
                        // .foregroundColor(.purple) // has no effect
                        // .frame(width: 200, height: 200) // doesn't scale
                        .scaleEffect(1.5)
                        .padding(15)
                        .tint(.blue)

                        Gauge(
                            value: value,
                            in: minimum ... maximum,
                            label: { Text("not displayed") },
                            currentValueLabel: {
                                Text(value).foregroundColor(.purple)
                            },
                            minimumValueLabel: {
                                Text(minimum).foregroundColor(.purple)
                            },
                            maximumValueLabel: {
                                Text(maximum).foregroundColor(.purple)
                            }
                        )
                        .gaugeStyle(.accessoryCircular)
                        // CircularGaugeStyle available in watchOS, but not iOS.
                        // .gaugeStyle(CircularGaugeStyle(tint: gradient))
                        .scaleEffect(1.5)
                        .padding(15)
                        // .tint(.teal)
                        .tint(Gradient(colors: [.blue, .yellow, .red]))
                    }
                }
                .textCase(nil)

                Section("accessoryCircularCapacity") {
                    Text("""
                    The currentValueLabel appears in the center \
                    and no other argument labels are used.
                    """)
                    .font(.caption)
                    // TODO: Can you specify the start angle on the circle?
                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: {},
                        currentValueLabel: {
                            Text("\(Int(value))").foregroundColor(.green)
                        }
                    )
                    .gaugeStyle(.accessoryCircularCapacity)
                    .scaleEffect(1.5)
                    .padding(15)
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
