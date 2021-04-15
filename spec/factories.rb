FactoryBot.define do
  factory :user do
    first_name { "Merrill" }
    last_name { "Nisker" }
    email { "peachesrocks@gmail.com" }
    password { "rubytuesday" }
    password_confirmation { "rubytuesday" }
  end

  factory :note do
    title { "Vestibulum Justo Egestas Adipi" }
    body { "Maecenas faucibus mollis interdum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec sed odio dui." }
  end
end