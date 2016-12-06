# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PinterestBackend.Repo.insert!(%PinterestBackend.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

user = PinterestBackend.Repo.insert!(%PinterestBackend.User{
	name: "Pankaj Rawat",
	email: "pankajrawat19sept@gmail.com",
	avatar: "http://lh5.googleusercontent.com/-NyAeSzz85MU/AAAAAAAAAAI/AAAAAAAABSo/BOdY1F3TRuU/photo.jpg"
	})

pin = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
		name: "Phoenix",
		image_url: "https://s3.amazonaws.com/media-p.slid.es/uploads/chrismccord/images/510002/phoenixframework-logo.png",
		url: "http://www.phoenixframework.org/",
		tags: "elixir,phoenix",
		description: "Phoenix is a web development framework written in Elixir which implements the server-side MVC pattern",
		user_id: user.id
	})

comment = PinterestBackend.Repo.insert!(%PinterestBackend.Comment{
		user_id: user.id,
		pin_id: pin.id,
		message: "Phoenix is Super Fast :-)"
	})