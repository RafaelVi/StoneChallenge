defmodule Calcula do
  def transaction(products, people) do
    _result = totalItems = calculateTotal(products)

    if !is_binary(totalItems) do
      if length(people) > 0 do
      splitAccount(totalItems, people);
      else
      "É preciso pelo menos um comprador"
      end
    else
      totalItems
    end
  end

  def calculateTotal(products) do
    _totalItems =
      if length(products) > 0 do
        totalItems = Enum.map(products, fn x -> Map.get(x, :price) * Map.get(x, :quantity) end)
        Enum.reduce(totalItems, fn x, acc -> x + acc end)
      else
        "É preciso pelo menos um produto"
      end
  end
  def splitAccount(totalItems,people) do
    _split =
      total = div(totalItems, length(people))
      result = Enum.map(people, fn x -> %{client: x, total: total} end)
      rest = rem(totalItems, length(people))

      if rest > 0 do
        List.replace_at(result, -1, %{List.last(result) | total: List.last(result).total + rest})
      else
        result
      end
  end
end

items = [
  %{name: "item1", price: 15000, quantity: 2},
  %{name: "item2", price: 20000, quantity: 1},
  %{name: "item3", price: 10000, quantity: 2}
]
#Todos os valores estão em centavos.

emails = ['email1@exemplo.com', 'email2@exemplo.com']

result = Calcula.transaction(items, emails)

IO.inspect(result)
