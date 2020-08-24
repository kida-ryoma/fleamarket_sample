crumb :root do
  link "トップページ", root_path
end

crumb :user do 
  link "マイページ", user_path(current_user.id)
end

crumb :credit_card_delete do
  link "クレジットカード削除", credit_card_path(:id)
  parent :user
end

crumb :credit_card do
  link "クレジットカード登録", new_credit_card_path
  parent :user
end
