defmodule Rocketpay.Numbers do
  # def sum_from_file(filename) do
  #   file = File.read("#{filename}.csv")

  #   handle_file(file)
  # end

  # Pipe Operator
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # defp handle_file({:ok, file}), do: file

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      # |> Enum.map(fn number -> String.to_integer(number) end)
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> IO.inspect()
      |> Enum.sum()

      {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
