defmodule Phxblog.RoleTest do
  use Phxblog.ModelCase

  alias Phxblog.Role

  @valid_attrs %{admin: true, name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Role.changeset(%Role{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Role.changeset(%Role{}, @invalid_attrs)
    refute changeset.valid?
  end
end
