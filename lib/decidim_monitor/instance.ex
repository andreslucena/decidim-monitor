defmodule DecidimMonitor.Instance do
  @instances %{
    "barcelona" => "https://decidim.barcelona",
    "hospitalet" => "https://www.lhon-participa.cat",
    "terrassa" => "https://decidim-terrassa.herokuapp.com",
    "gava" => "https://participa.gavaciutat.cat",
    "staging" => "http://staging.decidim.codegram.com"
  }

  @graphql_query "{ decidim { version } }"

  @query %{
    query: @graphql_query
  }

  def instances do
    Map.keys @instances
  end

  def lookup(id) do
    url = @instances[id]
    remote_data = remote_data(id)

    %{
      id: id,
      url: url,
      version: remote_data["version"]
    }
  end

  defp remote_data(id) do
    with %{body: body} <- request(@instances[id]),
         {:ok, body} <- Poison.Parser.parse(body),
         {:ok, data} <- Map.fetch(body, "data"),
         {:ok, decidim} <- Map.fetch(data, "decidim") do
      decidim
    else
      _ -> %{"version" => "<= 0.0.4"}
    end
  end

  def request(url) do
    Tesla.post("#{url}/api", Poison.encode!(@query), headers: %{"Content-Type" => "application/json"})
  end
end
