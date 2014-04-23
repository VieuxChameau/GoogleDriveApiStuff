# get the content of a file
file_id = 'someSha1'
result = client.execute(
api_method: drive.files.get,
  parameters: { fileId: file_id }
)


result = client.execute(
  api_method: drive.files.list
)

result.data.items.each do |item|
  puts item.id
end



result = client.execute(
  api_method: drive.files.list,
  parameters: { q: 'mimeType = "audio/mpeg" and description contains "bark"'}
)