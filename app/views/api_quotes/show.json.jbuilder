if @error
  json.error @error
else
  json.error nil
  json.id @quote.id
  json.qid @quote.qid
  json.cid @quote.cid
  json.text @quote.text
  json.author @quote.author
  json.date @quote.date
  json.count @count
end
