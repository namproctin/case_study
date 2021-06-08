namespace :sample_data do
  task create: :environment do
    Tech.destroy_all
    Category.destroy_all
    Project.destroy_all

    ruby = Tech.create(name: "Ruby")
    python = Tech.create(name: "Python")

    mvc = Category.create(tech: ruby, name: "MVC")
    data_science = Category.create(tech: python, name: "Data Science")
    web_dev = Category.create(tech: python, name: "Web dev")

    spree = Project.create(category: mvc, url: "https://github.com/spree/spree")
    atp = Project.create(category: mvc, url: "https://github.com/serodriguez68/rails-antipatterns")
    django = Project.create(category: web_dev, url: "https://github.com/django/django")
    flask = Project.create(category: web_dev, url: "https://github.com/pallets/flask")
    numpy = Project.create(category: data_science, url: "https://github.com/numpy/numpy")
    panda = Project.create(category: data_science, url: "https://github.com/pandas-dev/pandas")
  end
end