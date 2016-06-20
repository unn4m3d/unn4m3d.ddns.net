if @error
  json.error @error
else
  json.error nil
  json.results @quotes do |q|
    json.id q.id
    json.qid q.qid
    json.cid q.cid
    json.text q.text
    json.author q.author
    json.date q.date
  end
end
