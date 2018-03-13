task :seed => :environment do
  # first delete all existing records
  NewsPost.all.delete

  # seed database
  num = 1;
  3.times do
    NewsPost.create(title: "Post #{num}", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus tenetur totam tempore quos! Sunt nulla distinctio dolorem blanditiis eaque accusamus animi provident culpa? Laudantium dolor minima, necessitatibus unde dolore quod.")
    num += 1
  end
end
