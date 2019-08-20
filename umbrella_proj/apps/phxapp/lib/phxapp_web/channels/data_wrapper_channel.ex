defmodule PhxappWeb.DataWrapperChannel do
    use Phoenix.Channel

    def join("datawrapper:github", _payload, socket) do
        {:ok, socket}
    end

    def handle_in("get-repo-names", %{"org_name" => org_name}, socket) do
        repo_names = Datawrapper.get_org_repo_names(org_name)
        # it's a tuple, apparently a channel message payload must be a map
        response = %{"repo_names" => Tuple.to_list(repo_names)}
        {:reply, {:ok, response}, socket}
    end
end
