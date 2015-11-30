namespace :db do
  desc ""
  task create_product: :environment do
    50.times do |n|
      title  = "Продукт #{n+1}"
      description = Faker::Lorem.paragraph
      price = Faker::Number.decimal(5)
      image = ''
      group_id = Faker::Number.number(1).to_i + 1
      subgroup_id = Faker::Number.number(1).to_i + 1
      service_id = Faker::Number.number(1).to_i + 1
      Product.create!(title: title,
                      description: description,
                      price: price,
                      image: image,
                      group_id: group_id,
                      subgroup_id: subgroup_id,
                      service_id: service_id)
    end
  end
  task create_service: :environment do
    20.times do |n|
      title  = "Услуга #{n+1}"
      description = Faker::Lorem.paragraph
      price = Faker::Number.decimal(5, 2)
      Service.create!(title: title,
                      description: description,
                      price: price)
    end
  end
  task create_group: :environment do
    20.times do |n|
      title  = "Группа #{n+1}"
      show = 1
      Group.create!(title: title,
                    show: show)
    end
  end
  task create_subgroup: :environment do
    20.times do |n|
      title  = "Подгруппа #{n+1}"
      show = 1
      Subgroup.create!(title: title,
                       show: show)
    end
  end
end
