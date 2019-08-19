defmodule Datawrapper do
  @moduledoc """
  Documentation for Datawrapper.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Datawrapper.hello()
      :world

  """
  def parse_repo_names([head|tail]) do
      %{"name" => name} = head
      list = parse_repo_names(tail)
      [name] ++ list
  end

  def parse_repo_names([]) do
      []
  end

  def get_org_repo_names(orgname) do
      client = Tentacat.Client.new
      response = Tentacat.Repositories.list_orgs(client, orgname)
      list_of_maps = elem(response, 1)
      List.to_tuple(parse_repo_names(list_of_maps))
  end
end
