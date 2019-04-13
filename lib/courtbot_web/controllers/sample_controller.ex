defmodule CourtbotWeb.SampleController do
  use CourtbotWeb, :controller

  def csv(conn, %{"count" => count}) do
    {count, _} = Integer.parse(count)

    data =
      # CaseNumber,CaseStyle,HearingType,HearingDate,HearingTime,Court,County
      Enum.map(0..count, fn i ->
        "CR-2019-#{i},#{Faker.Name.first_name()} vs #{Faker.Name.last_name()},Hearing,8/25/2019,1:00 PM,,Ada\n"
      end)

    conn
    |> put_resp_content_type("text/csv")
    |> send_resp(200, data)
  end

  def csv(conn, _), do: csv(conn, %{"count" => 50})

end