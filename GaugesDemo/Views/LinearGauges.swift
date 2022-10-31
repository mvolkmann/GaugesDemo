import SwiftUI

struct LinearGauges: View {
    @State private var value = 0.0

    private var maximum = 10.0
    private var minimum = 0.0

    var body: some View {
        NavigationStack {
            Form {
                Section("Linear Capacity") {
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
                        currentValueLabel: { Text("\(Int(value))") },
                        minimumValueLabel: { Text("\(Int(minimum))") },
                        maximumValueLabel: { Text("\(Int(maximum))") }
                    )
                    // This fills with repeated images instead of a color.
                    .tint(ImagePaint(image: Image("star")))
                    .gaugeStyle(.linearCapacity)
                }
                .textCase(nil)

                Section("AccessoryLinear") {
                    Text("""
                    The label is not displayed. \
                    The currentValueLabel is only displayed if \
                    minimumValueLabel and maximumValueLabel are not provided. \
                    The optional minimumValueLabel and maximumValueLabel \
                    values appear on the leading and trailing edges.
                    """)
                    .font(.caption)
                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: {},
                        currentValueLabel: { Text("\(Int(value))") },
                        minimumValueLabel: { Text("\(Int(minimum))") },
                        maximumValueLabel: { Text("\(Int(maximum))") }
                    )
                    .tint(Gradient(
                        colors: [.blue, .green, .yellow, .orange, .red]
                    ))
                    .gaugeStyle(.accessoryLinear)
                }
                .textCase(nil)

                Section("AccessoryLinearCapacity") {
                    Text("""
                    The arguments are applied in the same way \
                    as with Linear Capacity.
                    """)
                    .font(.caption)
                    Gauge(
                        value: value,
                        in: minimum ... maximum,
                        label: { Text("Temperature") },
                        currentValueLabel: { Text("\(Int(value))") },
                        minimumValueLabel: { Text("\(Int(minimum))") },
                        maximumValueLabel: { Text("\(Int(maximum))") }
                    )
                    .tint(.red)
                    .gaugeStyle(.accessoryLinearCapacity)
                }
                .textCase(nil)
            }
            .navigationTitle("Linear Gauges")

            Spacer()
            Slider(value: $value, in: minimum ... maximum)
                .padding()
        }
    }
}
