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

user1 = PinterestBackend.Repo.insert!(%PinterestBackend.User{
	name: "Pankaj Rawat",
	email: "pankajrawat19sept@gmail.com",
	avatar: "http://lh5.googleusercontent.com/-NyAeSzz85MU/AAAAAAAAAAI/AAAAAAAABSo/BOdY1F3TRuU/photo.jpg"
	})

user2 = PinterestBackend.Repo.insert!(%PinterestBackend.User{
	name: "Ashish Singh",
	email: "ashish@aviabird.com",
	avatar: "https://lh4.googleusercontent.com/-fSBtaGY1dBI/AAAAAAAAAAI/AAAAAAAAACA/3AgjTIsrOhM/photo.jpg"
	})

pin1 = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
		name: "Phoenix",
		image_url: "https://s3.amazonaws.com/media-p.slid.es/uploads/chrismccord/images/510002/phoenixframework-logo.png",
		url: "http://www.phoenixframework.org/",
		tags: "elixir,phoenix",
		description: "Phoenix is a web development framework written in Elixir which implements the server-side MVC pattern",
		user_id: user1.id
	})

comment = PinterestBackend.Repo.insert!(%PinterestBackend.Comment{
		user_id: user1.id,
		pin_id: pin1.id,
		message: "Phoenix is Super Fast :-)"
	})

pin2 = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
		name: "Angular 2",
		image_url: "https://s-media-cache-ak0.pinimg.com/564x/67/86/76/678676dcbe6c5a19ab49b870ba8c34b5.jpg",
		url: "http://juristr.com/blog/2016/02/learning-ng2-creating-tab-component/",
		tags: "ng2,angular2",
		description: "Learning Angular 2: Creating a tabs component",
		user_id: user1.id
	})

pin3 = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
	name: "Angular 2",
	image_url: "https://s-media-cache-ak0.pinimg.com/564x/16/64/ab/1664ab992e23fc7c141cea211e52004d.jpg",
	url: "http://www.ng-newsletter.com/posts/beginner2expert-how_to_start.html",
	tags: "ng2,angular2",
	description: "Angular 2 Book ng-book2",
	user_id: user2.id
})

pin4 = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
	name: "Angular 2",
	image_url: "https://s-media-cache-ak0.pinimg.com/564x/82/2c/ac/822cace4bfff673287e0a06e680eb017.jpg",
	url: "http://www.ng-newsletter.com/posts/beginner2expert-how_to_start.html",
	tags: "ng2,angular2",
	description: "Angular 2 Blogs",
	user_id: user1.id
})

pin5 = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
	name: "Angular 2",
	image_url: "https://s-media-cache-ak0.pinimg.com/564x/f4/b2/ca/f4b2cac859e60596c13ae33a1c7f2b25.jpg",
	url: "http://bookspics.com/ebooks/unraveling-angular-2-the-ultimate-beginners-guide-with-over-130-complete-samples/",
	tags: "ng2,angular2",
	description: "NEW Angular 2 Book on Leanpub - Start learning the next generation web framework now! 35w",
	user_id: user2.id
})

pin6 = PinterestBackend.Repo.insert!(%PinterestBackend.Pin{
	name: "Angular2 Pipes Cheat Sheet2",
	image_url: "https://s-media-cache-ak0.pinimg.com/564x/8f/8a/27/8f8a27edb913578ef9e0ba27670969c1.jpg",
	url: "http://www.cheatography.com/nathane2005/cheat-sheets/angular2-pipes/",
	tags: "ng2,angular2",
	description: "Angular2 Pipes Cheat Sheet by Nathane2005 www.cheatography.... #cheatsheet #pipes",
	user_id: user1.id
})
