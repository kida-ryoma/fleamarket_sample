crumb :root do
  link "トップページ", root_path
end

crumb :user do 
  link "マイページ", user_path(current_user.id)
end

