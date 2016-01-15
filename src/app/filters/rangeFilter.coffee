app.filter "rangeFilter", ->
  (items, range) ->
    filtered = []
    min = parseInt range.from
    max = parseInt range.to
    for item in items
      if item.price >= min and item.price <= max
        filtered.push item
    return filtered
