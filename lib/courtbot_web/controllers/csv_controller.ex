defmodule CourtbotWeb.CsvController do
  use CourtbotWeb, :controller

  def idaho(conn, %{"count" => count}) when is_binary(count) do
    {count, _} = Integer.parse(count)

    idaho_data(conn, count)
  end

  defp idaho_data(conn, count) when count > 1_000_000 do
    conn
    |> send_resp(400, "Request too large")
  end

  defp idaho_data(conn, count) when count <= 0 do
    conn
    |> send_resp(400, "Request too small")
  end

  defp idaho_data(conn, count) do

    data =
      # CaseNumber,CaseStyle,HearingType,HearingDate,HearingTime,Court,County
      Enum.map(1..count, fn i ->

        date =
          Date.utc_today()
          |> Date.add(i)
          |> Date.to_string()
        "CR-#{date},#{Faker.Name.first_name()} vs #{Faker.Name.last_name()},Hearing,8/25/2019,1:00 PM,,Ada\n"
      end)

    conn
    |> put_resp_content_type("text/csv")
    |> send_resp(200, data)
  end

end