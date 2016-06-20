if error
  json.error @error
else
  json.error nil
  json.id @quote.id
end
