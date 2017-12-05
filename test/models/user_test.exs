defmodule Phxblog.UserTest do
  use Phxblog.ModelCase

  alias Phxblog.User
  alias Phxblog.TestHelper

  setup do
    {:ok, role}  = TestHelper.create_role(%{name: "user", admin: false})
    {:ok, role: role}
  end

  @valid_attrs %{email: "some email", password: "some password_digest", password_confirmation: "some password_digest", username: "some username"}
  @invalid_attrs %{}

  defp valid_attrs(role) do
    Map.put(@valid_attrs, :role_id, role.id)
  end

  test "changeset with valid attributes", %{role: role} do
    changeset = User.changeset(%User{}, valid_attrs(role))
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password_digest value gets set to a hash" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert Comeonin.Bcrypt.checkpw(@valid_attrs.password, 
      Ecto.Changeset.get_change(changeset, :password_digest))
  end

  test "password_digest value does not get set if password is nil" do
    changeset = User.changeset(%User{}, %{email: "test@test.com", password: nil, password_confirmation: nil, username: "test"})
    refute Ecto.Changeset.get_change(changeset, :password_digest)
  end
end
