defmodule PhxappWeb.DataWrapperChannel do
    use Phoenix.Channel

    def join("datawrapper:github", _payload, socket) do
        {:ok, socket}
    end

    def list_to_map([head|tail], counter) do
        map = %{counter => head}
        rest = list_to_map(tail, counter + 1)
        Map.merge(map, rest)
    end

    def list_to_map([], _counter) do
        %{}
    end

    def handle_in("get-repo-names", %{"org_name" => org_name}, socket) do
        repo_names = Datawrapper.get_org_repo_names(org_name)
        # it's a tuple, apparently a channel message payload must be a map
        response = list_to_map(Tuple.to_list(repo_names), 0)
        {:reply, {:ok, response}, socket}
    end
end
