json.data  @grouped_elements do |time, elements|
  json.set! :time, time

  json.elements do
    json.array!(elements, partial: "api/v1/elements/element", as: :element)
  end
end
