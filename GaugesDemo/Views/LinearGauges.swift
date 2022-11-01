import SwiftUI

struct LinearGauges: View {
    @State private var value = 0.0

    private var maximum = 100.0
    private var minimum = 0.0

    var body: some View {
        NavigationStack {
            Form {
                Section("linearCapacity") {
                    Text("""
                    The label appears above the gauge. \
                    The optional currentValueLabel appears below. \
                    The optional minimumValueLabel and maximumValueLabel \
                    appear on the leading and trailing edges.
                    """)
                    .font(.caption)

                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: { Text("Rating") },
                        currentValueLabel: { Text(value) },
                        minimumValueLabel: { Text(minimum) },
                        maximumValueLabel: { Text(maximum) }
                    )
                    .gaugeStyle(.linearCapacity) // default in iOS
                    .tint(.red)

                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: {}
                    )
                    // This fills with repeated images instead of a color.
                    .tint(ImagePaint(image: Image("star")))
                }
                .textCase(nil)

                Section("accessoryLinear") {
                    Text("""
                    The label is required but not displayed. \
                    The optional currentValueLabel is \
                    displayed on the leading edge only if \
                    minimumValueLabel and maximumValueLabel are not provided. \
                    The optional minimumValueLabel and maximumValueLabel \
                    values appear on the leading and trailing edges.
                    """)
                    .font(.caption)
                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: {},
                        currentValueLabel: {},
                        // currentValueLabel: { Text(value) }
                        minimumValueLabel: { Text(minimum) },
                        maximumValueLabel: { Text(maximum) }
                    )
                    .tint(Gradient(
                        colors: [.blue, .green, .yellow, .orange, .red]
                    ))
                    .gaugeStyle(.accessoryLinear)
                }
                .textCase(nil)

                Section("accessoryLinearCapacity") {
                    Text("""
                    The arguments are applied in the same way \
                    as with .linearCapacity.
                    """)
                    .font(.caption)
                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: { Text("Temperature") },
                        currentValueLabel: { Text(value) },
                        minimumValueLabel: { Text(minimum) },
                        maximumValueLabel: { Text(maximum) }
                    )
                    .tint(.red)
                    .gaugeStyle(.accessoryLinearCapacity)
                }
                .textCase(nil)
            }
            .navigationTitle("Linear Gauges")

            Spacer()

            // Slider(value: $value, in: minimum ... maximum)
            Slider(value: $value, in: minimum ... maximum)
                .padding()
        }
    }
}
