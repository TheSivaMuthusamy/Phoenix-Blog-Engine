defmodule Phxblog.PostView do
  use Phxblog.Web, :view

  def markdown(body) do
	  body
	  |> Earmark.to_html
	  |> raw
  end
end
