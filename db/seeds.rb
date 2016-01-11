User.destroy_all

User.create! [
  { username: "Fiorina", password_digest: "mrsroboto",
      profile: Profile.create!(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina") },
  { username: "Trump", password_digest: "dathairdoe",
      profile: Profile.create!(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump") },
  { username: "Carson", password_digest: "iluvcandy",
      profile: Profile.create!(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson") },
  { username: "Clinton", password_digest: "benghazi",
      profile: Profile.create!(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton") }
]

User.all.each do |user|
  user.todo_lists << TodoList.create!(
    list_name: "#{user.username}'s list", list_due_date: Date.today + 1.year
    )
  user.todo_lists.each do |list|
    5.times do
      list.todo_items << TodoItem.create!(
        title: "win presidency#{rand(1..10)}", description: "global domination starting with the presidency#{rand(1..10)}", due_date: Date.today + 1.year
        )
    end
  end
end
